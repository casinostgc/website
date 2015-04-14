class CreateCasinos < ActiveRecord::Migration
  def change
    create_table :casinos do |t|
      t.string :name
      t.string :slug
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :content

      t.timestamps null: false
    end
  end
end
