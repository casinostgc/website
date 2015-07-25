class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :subject
      t.text :content
      t.boolean :approved, default: false

      t.timestamps null: false
    end
  end
end
