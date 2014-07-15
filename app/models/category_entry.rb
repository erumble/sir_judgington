class CategoryEntry < ActiveRecord::Base
  belongs_to :category
  belongs_to :entry
  validate :validate_category

  def validate_category()
    unless entry.contest.has_category? category
      errors.add :base, "#{category.name} is not a valid category"
    end
  end

end
