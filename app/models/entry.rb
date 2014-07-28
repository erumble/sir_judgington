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
