class CreateWeaponsZombies < ActiveRecord::Migration
  def up
    create_table :weapons_zombies, id: false do |t|
      t.integer :weapon_id
      t.integer :zombie_id
    end
  end

  def down
  end
end
