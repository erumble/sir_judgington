class Cosplay < ActiveRecord::Base
  belongs_to :person
  belongs_to :character
  belongs_to :entry

  validates :person, :character, :entry, presence: true
end
