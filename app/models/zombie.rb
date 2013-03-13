class Zombie < ActiveRecord::Base
  attr_accessible :age, :bio, :name
  
  scope :rotting, where(rotting: true)
end
