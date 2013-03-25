class Zombie < ActiveRecord::Base
  attr_accessible :age, :bio, :name, :email, :decomposition
  
  validates_presence_of :name
  
  has_one :brain, dependent: :destroy
  has_many :tweets
  has_many :role_assignments
  has_many :roles, through: :role_assignments
  
  before_save :make_rotting
  after_save :decomp_change_modification, if: :decomposition_changed?
  
  scope :rotting, where(rotting: true)
  scope :fresh, where("age < 20")
  scope :recent, order("created_at desc").limit(3)
  
  def make_rotting
    self.rotting = isOlderThen20? if age
    true
  end
  
  def isOlderThen20?
    age > 20
  end
  
  def avatar_url
    "http://zombietar.com/#{id}.jpg"
  end
  
  private
  def decomp_change_modification
    ZombieMailer.decomp_change(self).deliver
  end
end
