class Person < ActiveRecord::Base
  has_many :cosplays
  has_many :characters, through: :cosplays
  has_many :entries, through: :cosplays
end
