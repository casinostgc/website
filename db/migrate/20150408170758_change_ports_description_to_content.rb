class ChangePortsDescriptionToContent < ActiveRecord::Migration
  def change
  	rename_column :ports, :description, :content
  end
end
