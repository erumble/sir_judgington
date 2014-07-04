class Costume < ActiveRecord::Base
  belongs_to :owner, class_name: 'Contestant'
end
