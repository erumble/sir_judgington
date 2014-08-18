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

  # delegate :first_name, :last_name, :email, to: :contestants
  # accepts_nested_attributes_for :contestants, :category_entries

  private

  def validate_judging_time()
    unless judging_time.nil? || contest.has_judging_time?(judging_time)
      errors.add :judging_time, 'is not available'
    end

    if judging_time && exhibition?
      errors.add :judging_time, 'exhibition entries are not judged'
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
