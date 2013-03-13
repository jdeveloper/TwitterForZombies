class Brain < ActiveRecord::Base
  attr_accessible :flavor, :status, :zombie_id
end
