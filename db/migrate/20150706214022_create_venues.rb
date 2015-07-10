class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :slug
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :type
      t.text :content

      t.timestamps null: false
    end
  end
end
