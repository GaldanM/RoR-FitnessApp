class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :day, null: false
      t.string :time, null: false
      t.string :description, null: false
      t.string :instructor, null: false
      t.date :start_date, null: false
    end
  end
end
