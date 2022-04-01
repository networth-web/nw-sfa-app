class CreateTemplateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :template_models do |t|
      t.integer :template_type, null: false
      t.text    :template_text, null: false
      t.timestamps
    end
  end
end