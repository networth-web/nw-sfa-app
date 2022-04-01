class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string     :name,              null: false
      t.text       :description,       null: false
      t.boolean    :approval,          null: false
      t.timestamps
    end
  end
end