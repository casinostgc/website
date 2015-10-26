class CreateCruises < ActiveRecord::Migration
  def change
    create_table :cruises do |t|
      t.string :title
      t.string :slug
      t.belongs_to :venue, index: true, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.text :content

      t.timestamps null: false
    end
  end
end
