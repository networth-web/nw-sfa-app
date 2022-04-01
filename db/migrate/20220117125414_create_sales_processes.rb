class CreateSalesProcesses < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_processes do |t|
      t.string  :name,        null: false
      t.text    :description, null: false
      t.timestamps
    end
  end
end

