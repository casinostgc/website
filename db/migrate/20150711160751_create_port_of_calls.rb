class CreatePortOfCalls < ActiveRecord::Migration
  def change
    create_table :port_of_calls do |t|
      t.datetime :arrives_at
      t.datetime :departs_at
      t.integer :position
      t.belongs_to :cruise, index: true, foreign_key: true
      t.belongs_to :port, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
