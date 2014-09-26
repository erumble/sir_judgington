class Character < ActiveRecord::Base
  has_many :cosplays, inverse_of: :character
  has_many :persons, through: :cosplays
  has_many :entries, through: :cosplays
end
