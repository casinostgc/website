class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.string :name
      t.string :slug
      t.string :location
      t.text :content
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
