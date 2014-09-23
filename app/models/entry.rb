class Entry < ActiveRecord::Base
  enum skill_level: { exhibition: 0,
                      youth:      1,
                      novice:     2,
                      journeyman: 3,
                      master:     4 }

  belongs_to :contest
  belongs_to :judging_time

  has_many :category_entries
  has_many :categories, through: :category_entries

  has_many :cosplays
  has_many :contestants, through: :cosplays, source: :owner
  has_many :characters, through: :cosplays

  validate :validate_judging_time
  validates :contest, presence: true
  validates :cosplays, presence: true

  accepts_nested_attributes_for :cosplays, :reject_if => :all_blank, :allow_destroy => true

  after_create :set_entry_num
  around_update :change_entry_num_if_necessary

  delegate :number_chalice, to: :contest, prefix: true

  scope :hot_and_bulky, -> { where(hot_or_bulky: true) }
  scope :exhibition, -> { where(skill_level: 0) }
  scope :regular, -> { where(hot_or_bulky: false, skill_level: [1..4] ) }

  private

  def change_entry_num_if_necessary
    update_entry_num = if self.skill_level_changed?
      self.changes[:skill_level].include? 'exhibition'
    elsif self.hot_or_bulky_changed?
      !self.exhibition?
    end

    yield

    self.reload # this must be called or very bad things happen
    set_entry_num if update_entry_num
  end

  def set_entry_num
    entry_num = if exhibition?
      "EX-#{get_num_from_chalice(:exhibition).to_s.rjust(2, '0')}"
    elsif hot_or_bulky?
      "HB-#{get_num_from_chalice(:hot_or_bulky).to_s.rjust(2, '0')}"
    else
      get_num_from_chalice(:regular).to_s.rjust(2, '0')
    end

    update!(entry_num: entry_num)
  end

  def get_num_from_chalice(series)
    retries = 0
    begin
      number_chalice = contest_number_chalice.reload
      num = number_chalice.send("next_#{series.to_s}".to_sym)
      number_chalice.update!(series.to_sym => num)
      num
    rescue ActiveRecord::StaleObjectError
      raise if retries >= 3
      retries += 1
      retry
    end
  end

  def validate_judging_time()
    unless judging_time.nil? || contest.has_judging_time?(judging_time)
      errors.add :judging_time, 'is not available'
    end

    if judging_time && exhibition?
      errors.add :judging_time, 'exhibition entries are not judged'
    end

    if !exhibition? && judging_time.nil?
      errors.add :judging_time, 'is required for non-exhibition entries'
    end
  end

end
#
# Legal Name:
#
# Nickname/Alias (optional):
#
# Email Address:
#
# Character Name:
#
# Show/Game/Property Name:
#
# Who made your costume?
#
# Skill Level (see the back of this form for descriptions)
#
# ____ Youth ____ Novice ____ Journeyman ____ Master
#
# The judges may adjust your skill level based on your interview. If left blank, they will select a skill level.
#
# Category (select all that apply)
#
# ____ Anime ____ Manga ____ Video Game
#
# ____ Original Design ____ Accuracy ____ Props
#
# ____ Construction ____ Other Media (BJD, Fashion, etc)
