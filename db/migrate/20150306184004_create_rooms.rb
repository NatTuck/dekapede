class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string  :name,    null: false
      t.integer :zone_id, null: false
      t.integer :xx,      null: false
      t.integer :yy,      null: false
      t.integer :zz,      null: false
      t.text    :desc,    null: false
      t.text    :props,   null: false, default: ""

      t.timestamps null: false
    end
  end
end
