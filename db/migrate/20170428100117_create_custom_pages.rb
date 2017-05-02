class CreateCustomPages < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_pages do |t|
      t.string :title, null: false
      t.string :text, null: false
      t.boolean :editable, default: true
    end
  end
end
