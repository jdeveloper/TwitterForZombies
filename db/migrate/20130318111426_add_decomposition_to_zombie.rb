class AddDecompositionToZombie < ActiveRecord::Migration
  def change
    change_table :zombies do |t|
      t.string :decomposition
    end
  end
end
