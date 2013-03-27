class AddZombieIdToWeapons < ActiveRecord::Migration
  def change
    add_column :weapons, :zombie_id, :integer
  end
end
