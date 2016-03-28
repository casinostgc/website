class CreateCruiseLists < ActiveRecord::Migration
  def change
    create_table :cruise_lists do |t|
      t.string :title
      t.string :slug
      t.belongs_to :venue, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
