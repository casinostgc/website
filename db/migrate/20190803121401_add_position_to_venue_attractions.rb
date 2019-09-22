class AddPositionToVenueAttractions < ActiveRecord::Migration
  def change
    add_column :venue_attractions, :position, :integer
  end
end
