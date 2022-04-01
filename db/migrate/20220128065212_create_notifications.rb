class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer    :notification_type, null: false
      t.boolean    :checked,           null: false, default: false
      t.integer    :lead_count
      t.references :visitor,                                       foreign_key: { to_table: :users }
      t.references :visited,           null: false,                foreign_key: { to_table: :users }
      t.references :lead,                                          foreign_key: true
      t.timestamps
    end
  end
end