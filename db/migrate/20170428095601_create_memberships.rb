class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.float :price, null: false
    end
  end
end
