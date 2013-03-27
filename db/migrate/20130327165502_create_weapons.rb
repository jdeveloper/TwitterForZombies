class CreateWeapons < ActiveRecord::Migration
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :ammo
      t.boolean :is_broken
      t.date :purchad_on

      t.timestamps
    end
  end
end
