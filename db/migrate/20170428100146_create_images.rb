class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :filename, null: false
      t.string :alt_text, null: false
      t.string :caption, null: false
    end
  end
end
