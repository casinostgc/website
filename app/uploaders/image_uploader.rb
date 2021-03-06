# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

	# Include RMagick or MiniMagick support:
	include CarrierWave::RMagick
	# include CarrierWave::MiniMagick

	# Choose what kind of storage to use for this uploader:
	# storage :file
	storage :fog

	# Override the directory where uploaded files will be stored.
	# This is a sensible default for uploaders that are meant to be mounted:
	def store_dir
		imageable_type = model.imageable_type.present? ? model.imageable_type.underscore : model.class.to_s.underscore
		imageable_id = model.imageable_id.present? ? model.imageable_id : model.id
		# "#{ENV['AWS_S3_DIR']}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
		# "#{ENV['AWS_S3_DIR']}/#{model.class.to_s.underscore}/#{model.id}"
		"#{ENV['AWS_S3_DIR']}/#{imageable_type}/#{imageable_id}"
	end

	# Provide a default URL as a default if there hasn't been a file uploaded:
	# def default_url
	#   # For Rails 3.1+ asset pipeline compatibility:
	#   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
	#
	#   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
	# end

	# Process files as they are uploaded:
	# process :scale => [200, 300]
	#
	# def scale(width, height)
	#   # do something
	# end

	# Create different versions of your uploaded files:
	# version :thumb do
	#   process :resize_to_fit => [50, 50]
	# end

	version :featured do
		process resize_to_fill: [735, 400]
	end

	version :thumb do
	  process resize_to_fit: [175, 175]
	end

	version :attraction, if: :is_attraction? do
		process resize_to_fill: [175, 100]
	end

	# Add a white list of extensions which are allowed to be uploaded.
	# For images you might use something like this:
	def extension_white_list
		%w(jpg jpeg gif png)
	end

	# Override the filename of the uploaded files:
	# Avoid using model.id or version_name here, see uploader/store.rb for details.
	# def filename
	#   "something.jpg" if original_filename
	# end

	protected

	def is_attraction?(new_file)
		# puts new_file.uploader.model.attributes
		# model.imageable_type.underscore == 'attraction'
		false
	end

end
