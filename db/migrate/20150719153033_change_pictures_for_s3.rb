class ChangePicturesForS3 < ActiveRecord::Migration
	def change
		remove_column :pictures, :gh_name, :string
		remove_column :pictures, :gh_url, :string
		add_column :pictures, :image, :string
	end
end
