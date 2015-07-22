module S3Uploader
	extend ActiveSupport::Concern

	included do
		mount_uploader :image, ImageUploader

		# attr_accessor :tmp_file, :tmp_s3_file
		# after_create :upload_image, unless: -> { self.tmp_s3_file }
	end

	module ClassMethods

		def reprocess(uploader=:image)
			self.find_each do |model| 
				begin
					model.send(uploader).cache_stored_file! 
					model.send(uploader).retrieve_from_cache!(model.send(uploader).cache_name) 
					model.send(uploader).recreate_versions! 
					model.save!
				rescue => e
					puts  "ERROR: #{self.to_s.titleize}: #{model.id} -> #{e.to_s}"
				end
			end
		end

	end

	# def upload_image
	# 	uploader = ImageUploader.new
	# 	uploader.store! self.tmp_file.tempfile
	# 	# uploader.retrieve_from_store!('my_file.png')
	# end


end