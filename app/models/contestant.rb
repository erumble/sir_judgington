class Contestant < ActiveRecord::Base
  has_many :owned_costumes, class_name: 'Costume', foreign_key: 'owner_id'
  has_and_belongs_to_many :created_costumes, class_name: 'Costume'
  has_and_belongs_to_many :entries
end
