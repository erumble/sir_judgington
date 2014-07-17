class CategoryEntry < ActiveRecord::Base
  belongs_to :category
  belongs_to :entry
  validates :category, :entry, presence: true
  validate :validate_category

  private

  def validate_category()
    if category && entry && !entry.contest.has_category?(category)
      errors.add :category, 'is not valid for this contest'
    end
  end

end
