class FixForeignKeysPortOfCalls < ActiveRecord::Migration
  def change
  	remove_foreign_key :port_of_calls, name: "fk_rails_f7992d6eeb"
  end
end


