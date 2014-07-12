class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
    	t.string :name
    	t.string :slug
      t.text :content
      t.string :location
      t.float :latitude
      t.float :longitude
      t.boolean :international

      t.timestamps
    end
  end
end
