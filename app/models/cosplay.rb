class Cosplay < ActiveRecord::Base
  belongs_to :owner, class_name: 'Person'
  belongs_to :character
  belongs_to :entry

  validates :owner, :character, presence: true

  delegate :first_name, :last_name, :full_name, :email, :phonetic_spelling, to: :owner, prefix: true
  delegate :name, :property, to: :character, prefix: true

  accepts_nested_attributes_for :owner, :reject_if => :all_blank
  accepts_nested_attributes_for :character, :reject_if => :all_blank
end
