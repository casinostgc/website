class AddDistanceToCasinoDestinations < ActiveRecord::Migration
  def change
    add_column :casino_destinations, :distance, :decimal
  end
end
