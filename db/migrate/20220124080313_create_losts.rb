class CreateLosts < ActiveRecord::Migration[6.0]
  def change
    create_table :losts do |t|
      t.text       :reason, null: false
      t.references :lead,   null: false, foreign_key: true
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end