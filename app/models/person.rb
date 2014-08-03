class Person < ActiveRecord::Base
  has_many :cosplays, foreign_key: 'owner_id'
  has_many :characters, through: :cosplays
  has_many :entries, through: :cosplays
end
