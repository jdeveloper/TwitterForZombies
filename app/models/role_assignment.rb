class RoleAssignment < ActiveRecord::Base
  belongs_to :role
  belongs_to :zombie
end