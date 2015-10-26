class ChangePortOfCallEventToCruise < ActiveRecord::Migration
  def change
  	rename_column :port_of_calls, :event_id, :cruise_id
  end
end
