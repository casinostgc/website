class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :start_at
      t.datetime :end_at
      t.integer :venue_id
      t.integer :image_id

      t.timestamps
    end
  end
end
