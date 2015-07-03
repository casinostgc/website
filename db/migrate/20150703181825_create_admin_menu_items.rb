class CreateAdminMenuItems < ActiveRecord::Migration
  def change
    create_table :admin_menu_items do |t|
      t.string :href
      t.string :icon
      t.integer :position
      t.string :text
      t.references :page, index: true, foreign_key: true
      t.boolean :blank_target

      t.timestamps null: false
    end
  end
end
