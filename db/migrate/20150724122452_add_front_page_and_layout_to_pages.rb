class AddFrontPageAndLayoutToPages < ActiveRecord::Migration
  def change
    add_column :pages, :front_page, :boolean
    add_column :pages, :container_layout, :boolean, default: true
  end
end
