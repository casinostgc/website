class AddBlankTargetToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :blank_target, :boolean
  end
end
