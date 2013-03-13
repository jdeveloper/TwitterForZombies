class Role < ActiveRecord::Base
  attr_accessible :title
  has_many :role_assignments
  has_many :zombies, through: :role_assingments
end