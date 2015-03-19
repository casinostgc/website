class AddPageToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :page_id, :integer
  end
end
