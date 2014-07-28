class Cosplay < ActiveRecord::Base
  belongs_to :owner, class_name: 'Person'
  belongs_to :character
  belongs_to :entry

  validates :owner, :character, :entry, presence: true
end
