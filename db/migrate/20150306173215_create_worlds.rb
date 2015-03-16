class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.string :name, null: false
      t.integer :spawn_room_id

      t.timestamps null: false
    end
  end
end
