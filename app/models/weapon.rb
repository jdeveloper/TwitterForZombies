class Weapon < ActiveRecord::Base
  attr_accessible :ammo, :is_broken, :name, :purchad_on
  
  belongs_to :zombie
end
