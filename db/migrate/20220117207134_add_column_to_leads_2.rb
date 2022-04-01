class AddColumnToLeads2 < ActiveRecord::Migration[6.0]
  def change
    add_reference :leads, :sales_process, null: false, default: 1, foreign_key: true, comment: "営業プロセスID"
  end
end
