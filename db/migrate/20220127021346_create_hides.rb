class CreateHides < ActiveRecord::Migration[6.0]
  def change
    create_table :hides do |t|
      t.text       :reason, null: false
      t.references :lead,   null: false, foreign_key: true
      t.timestamps
    end
  end
end