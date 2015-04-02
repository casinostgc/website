class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :destination_id
      t.string :departing_location
      t.datetime :departing_at
      t.string :arriving_location
      t.datetime :arriving_at
      t.string :flight_number

      t.timestamps
    end
  end
end
