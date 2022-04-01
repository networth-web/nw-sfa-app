class AddColumnToLeads3 < ActiveRecord::Migration[6.0]
  def change
    add_reference :leads, :owner,  foreign_key: { to_table: :users }, comment: "担当者ID"
    add_reference :leads, :closer, foreign_key: { to_table: :users }, comment: "クローザーID"
  end
end