class AddCodeToCasinos < ActiveRecord::Migration
  def change
    add_column :casinos, :code, :string
  end
end
