class Category < ActiveRecord::Base
  has_and_belongs_to_many :contests
  has_many :category_entries
  has_many :entries, through: :category_entries
end
