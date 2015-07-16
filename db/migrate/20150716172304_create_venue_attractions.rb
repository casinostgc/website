class CreateVenueAttractions < ActiveRecord::Migration
  def change
    create_table :venue_attractions do |t|
      t.belongs_to :venue, index: true, foreign_key: true
      t.belongs_to :attraction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
