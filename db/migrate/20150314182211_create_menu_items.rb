class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :href
      t.string :icon
      t.integer :position
      t.string :value
      t.integer :page_id
      t.boolean :blank_target

      t.timestamps
    end
  end
end
