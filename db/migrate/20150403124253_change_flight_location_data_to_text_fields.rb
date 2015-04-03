class ChangeFlightLocationDataToTextFields < ActiveRecord::Migration
  def change
  	change_column :flights, :arriving_location, :text
  	change_column :flights, :departing_location, :text
  end
end
