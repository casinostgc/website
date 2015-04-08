class CreatePortOfCalls < ActiveRecord::Migration
  def change
    create_table :port_of_calls do |t|
      t.references :cruise, index: true
      t.references :port, index: true
      t.datetime :arrives_at
      t.datetime :departs_at
      t.integer :position

      t.timestamps
    end
  end
end
