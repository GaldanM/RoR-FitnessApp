class CreateJoinTableCustomPagesImages < ActiveRecord::Migration[5.0]
  def change
    create_join_table :custom_pages, :pictures do |t|
      t.index [:custom_page_id, :picture_id]
      t.index [:picture_id, :custom_page_id]
    end
  end
end
