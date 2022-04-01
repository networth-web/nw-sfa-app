class CreateSeminars < ActiveRecord::Migration[6.0]
  def change
    create_table :seminars do |t|
      t.string   :title,           null: false
      t.text     :description,     null: false
      t.string   :instructor,      null: false
      t.datetime :start_date_time, null: false
      t.datetime :end_date_time,   null: false
      t.integer  :format,          null: false
      t.string   :url
      t.timestamps
    end
  end
end