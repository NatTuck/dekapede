class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name,      null: false
      t.integer :world_id, null: false
      t.integer :size,     null: false # Has size*size*size rooms.

      t.timestamps null: false
    end
  end
end
