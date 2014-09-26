class Cosplay < ActiveRecord::Base
  belongs_to :person, inverse_of: :cosplays
  belongs_to :character, inverse_of: :cosplays
  belongs_to :entry, inverse_of: :cosplays

  validates :person, :character, presence: true
  validates :person, uniqueness: { scope: :entry }

  delegate :first_name, :last_name, :full_name, :email, :phonetic_spelling, to: :person, prefix: true
  delegate :name, :property, to: :character, prefix: true

  accepts_nested_attributes_for :person, :reject_if => :all_blank
  accepts_nested_attributes_for :character, :reject_if => :all_blank
end
