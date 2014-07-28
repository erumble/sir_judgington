class Character < ActiveRecord::Base
  has_many :cosplays
  has_many :people, through: :cosplays
  has_many :entries, through: :cosplays
end
