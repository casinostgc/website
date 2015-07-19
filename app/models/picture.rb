class Picture < ActiveRecord::Base

	# include GithubMediaUploader
	include S3Uploader

	belongs_to :imageable, polymorphic: true

end
