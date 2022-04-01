class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :user, null: false, foreign_key: true
      t.references :lead, null: false, foreign_key: true
      t.timestamps
    end
  end
end
