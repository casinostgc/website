class DeleteFlightForeignKey < ActiveRecord::Migration
  def change
  	remove_foreign_key :flights, name: "fk_rails_17532769c7"
  end
end