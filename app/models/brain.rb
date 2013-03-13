class Brain < ActiveRecord::Base
  attr_accessible :flavor, :status, :zombie_id
  
  belongs_to :zombie
end
