class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :slug
      t.references :venue, index: true, foreign_key: true
      t.string :host
      t.datetime :start_at
      t.datetime :end_at
      t.string :type
      t.text :content

      t.timestamps null: false
    end
  end
end
