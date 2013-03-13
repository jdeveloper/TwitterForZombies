class Zombie < ActiveRecord::Base
  attr_accessible :age, :bio, :name
  has_one :brain, dependent: :destroy
  has_many :role_assignments
  has_many :roles, through: :role_assignments
  
  before_save :make_rotting
  
  scope :rotting, where(rotting: true)
  scope :fresh, where("age < 20")
  scope :recent, order("created_at desc").limit(3)
  
  def make_rotting
    self.rotting = isOlderThen20?
    true
  end
  
  def isOlderThen20?
    age > 20
  end
end
