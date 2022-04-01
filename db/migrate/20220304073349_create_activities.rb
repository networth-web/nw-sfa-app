class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.integer    :activity_type,   null: false
      t.string     :action_name
      t.integer    :meeting_type
      t.integer    :order_type
      t.text       :overview,        null: false
      t.datetime   :start_date_time, null: false
      t.datetime   :end_date_time
      t.references :lead,            null: false, foreign_key: true
      t.references :creator,         null: false, foreign_key: { to_table: :users }
      t.references :attender,                     foreign_key: { to_table: :users }
      t.references :property,                     foreign_key: true
      t.timestamps
    end
  end
end