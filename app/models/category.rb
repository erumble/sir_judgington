class Category < ActiveRecord::Base
  has_and_belongs_to_many :entries, -> { readonly }
  has_and_belongs_to_many :contests
end
