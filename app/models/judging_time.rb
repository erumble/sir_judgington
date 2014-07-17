class JudgingTime < ActiveRecord::Base
  has_and_belongs_to_many :contests
  has_many :entries
end
