class Zombie < ActiveRecord::Base
  attr_accessible :age, :bio, :name
  
  scope :rotting, where(rotting: true)
  scope :fresh, where("age < 20")
  scope :recen, order("created_at desc").limit(3)
end
