class Contestant < ActiveRecord::Base
  has_many :costumes, foreign_key: 'owner_id'
end
