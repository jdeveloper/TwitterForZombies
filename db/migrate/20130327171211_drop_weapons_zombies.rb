class DropWeaponsZombies < ActiveRecord::Migration
  def up
    drop_table :weapons_zombies
  end

  def down
  end
end
