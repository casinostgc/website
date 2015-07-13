class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :caption
      t.string :alt
      t.text :description
      t.string :gh_name
      t.string :gh_url
      t.references :imageable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
