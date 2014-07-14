class Contest < ActiveRecord::Base
  has_many :entries
  has_and_belongs_to_many :categories

  def has_category?(category)
    categories.include? category
  end
end
