class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :text, null: false
      t.datetime :date, null: false
    end
  end
end
