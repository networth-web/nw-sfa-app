class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer    :number,   null: false
      t.integer    :price,    null: false
      t.references :property, null: false, foreign_key: true
      t.timestamps
    end
    add_index :rooms, [:number, :property_id], unique: true
  end
end
