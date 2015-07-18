class Picture < ActiveRecord::Base

	include GithubMediaUploader

	belongs_to :imageable, polymorphic: true

end
