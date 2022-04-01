class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :name,   null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
