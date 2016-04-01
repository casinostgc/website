class AddFeaturedToPortOfCalls < ActiveRecord::Migration
  def change
    add_column :port_of_calls, :featured, :boolean, default: false
  end
end
