class Entry < ActiveRecord::Base
  enum skill_level: { exhibition: 0,
                      youth:      1,
                      novice:     2,
                      journeyman: 3,
                      master:     4 }

  has_and_belongs_to_many :categories
  # has_and_belongs_to_many :categories, before_add: :validate_category
  has_and_belongs_to_many :contestants
  belongs_to :contest
  validate :categories_are_in_contest

  def categories_are_in_contest()
    categories.find_each do |c|
      unless contest.has_category? c
        errors.add :base, "#{c.name} is not a valid category"
      end
    end
  end

  def validate_category(category)
    unless contest.has_category? category
      errors.add :base, "#{category.name} is not a valid category"
      raise "#{category.name} is not a valid category"
    end
  end

end
