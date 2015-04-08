class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
