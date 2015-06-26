class CreateCasinoDestinations < ActiveRecord::Migration
  def change
    create_table :casino_destinations do |t|
      t.references :casino, index: true
      t.references :destination, index: true
      t.decimal :distance

      t.timestamps null: false
    end
  end
end
