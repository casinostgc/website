class CreateCruiseListDates < ActiveRecord::Migration
  def change
    create_table :cruise_list_dates do |t|
      t.belongs_to :cruise_list, index: true, foreign_key: true
      t.datetime :departs_at

      t.timestamps null: false
    end
  end
end
