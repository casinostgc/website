module S3Uploader
	extend ActiveSupport::Concern

	included do
		mount_uploader :image, ImageUploader

		# attr_accessor :tmp_file, :tmp_s3_file

		# after_create :upload_image, unless: -> { self.tmp_s3_file }
	end

	module ClassMethods
	end

	# def upload_image
	# 	uploader = ImageUploader.new
	# 	uploader.store! self.tmp_file.tempfile
	# 	# uploader.retrieve_from_store!('my_file.png')
	# end


end