class Cosplay < ActiveRecord::Base
  belongs_to :owner, class_name: 'Person'
  belongs_to :character
  belongs_to :entry

  validates :owner, :character, :entry, presence: true

  delegate :first_name, :last_name, :email, :phonetic_spelling, to: :owner, prefix: true
  delegate :name, :property, to: :character, prefix: true
end
