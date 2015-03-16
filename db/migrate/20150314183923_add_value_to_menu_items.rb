class AddValueToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :value, :string
  end
end
