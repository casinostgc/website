class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :imageable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :pictures, :imageable
  end
end
