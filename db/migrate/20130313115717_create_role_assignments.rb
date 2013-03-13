class CreateRoleAssignments < ActiveRecord::Migration
  def up
    create_table :role_assignments do |t|
      t.integer :zombie_id
      t.integer :role_id
    end
    
    add_index :role_assignments, :zombie_id
    add_index :role_assignments, :role_id
  end

  def down
  end
end
