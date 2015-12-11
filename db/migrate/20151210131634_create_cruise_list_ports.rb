class CreateCruiseListPorts < ActiveRecord::Migration
  def change
    create_table :cruise_list_ports do |t|
      t.string :arrival
      t.string :departure
      t.integer :position
      t.belongs_to :cruise_list, index: true, foreign_key: true
      t.belongs_to :port, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
