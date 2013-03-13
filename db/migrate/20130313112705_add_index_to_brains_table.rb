class AddIndexToBrainsTable < ActiveRecord::Migration
  def change
    add_index :brains, :zombie_id
  end
end
