class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string  :name,     null: false
      t.integer :user_id,  null: false
      t.integer :world_id, null: false

      t.integer :room_id
      t.text    :props,    null: false, default: ""

      t.timestamps null: false
    end
  end
end
