class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string     :title,              null: false
      t.text       :description,        null: false
      t.datetime   :schedule_date_time, null: false
      t.references :lead,               null: false, foreign_key: true
      t.references :creator,            null: false, foreign_key: { to_table: :users }
      t.references :attender,                        foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end