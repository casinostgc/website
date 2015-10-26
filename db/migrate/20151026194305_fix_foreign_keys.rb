class FixForeignKeys < ActiveRecord::Migration
  def change
  	remove_foreign_key :events, name: "fk_rails_f476266cf4"
  end
end
