class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :destination, index: true, foreign_key: true
      t.text :departing_location
      t.text :arriving_location
      t.datetime :departing_at
      t.datetime :arriving_at
      t.string :departing_airport
      t.string :arriving_airport
      t.string :flight_number

      t.timestamps null: false
    end
  end
end
