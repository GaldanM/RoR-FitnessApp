class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :membership
      t.belongs_to :course, index: true, null: false
    end
  end
end
