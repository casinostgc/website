class AddAirportDataToFligths < ActiveRecord::Migration
  def change
    add_column :flights, :arriving_airport, :string
    add_column :flights, :departing_airport, :string
  end
end
