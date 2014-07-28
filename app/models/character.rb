class Character < ActiveRecord::Base
  has_many :cosplays
  has_many :owners, through: :cosplays
  has_many :entries, through: :cosplays
end
