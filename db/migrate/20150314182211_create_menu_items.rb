class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :href
      t.string :icon
      t.integer :position

      t.timestamps
    end
  end
end
