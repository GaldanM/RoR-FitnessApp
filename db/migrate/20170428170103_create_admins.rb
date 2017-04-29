class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :login, null: false
      t.string :password_digest, null: false
    end
  end
end
