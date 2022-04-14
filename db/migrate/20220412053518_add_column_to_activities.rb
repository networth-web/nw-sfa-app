class AddColumnToActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :room, foreign_key: true
  end
end
