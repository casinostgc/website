class ChangeFlightColumnsForCasinoCodes < ActiveRecord::Migration
	def change
		rename_column :flights, :destination_id, :casino_id
		remove_column :flights, :arriving_location, :text
		remove_column :flights, :arriving_airport, :string
		remove_column :flights, :flight_number, :string
	end
end
