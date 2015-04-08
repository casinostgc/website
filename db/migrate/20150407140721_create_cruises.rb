class CreateCruises < ActiveRecord::Migration
  def change
    create_table :cruises do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :start_at
      t.datetime :end_at
      t.references :venue, index: true

      t.timestamps
    end
  end
end
