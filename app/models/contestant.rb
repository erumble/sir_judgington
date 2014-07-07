class Contestant < ActiveRecord::Base
  has_many :costumes, foreign_key: 'owner_id'
  has_and_belongs_to_many :entries
end
