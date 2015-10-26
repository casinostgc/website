class ChangeEventVenueToCasino < ActiveRecord::Migration
  def change
  	rename_column :events, :venue_id, :casino_id
  end
end
