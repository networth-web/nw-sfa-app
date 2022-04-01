class AddColumnToLeads < ActiveRecord::Migration[6.0]
  def change
    add_reference :leads, :source, null: false, foreign_key: true, comment: "ソースID"
  end
end