module ImageableBuilder
	extend ActiveSupport::Concern

	included do
		# before_action :build_pictures, only: [:new, :edit]
	end

	def build_pictures(instance)
		# @instance = params[:id].present? ? klass.find(params[:id]) : klass.new
		1.times do
			instance.pictures.build
		end
	end

	def picture_params
		# [:id, :name, :image, :imageable_id, :imageable_type, :_destroy]
		[:id, :tmp_file, :title, :caption, :alt, :_destroy]
	end

	private

	# def klass
	# 	params[:controller].classify.demodulize.constantize
	# end

end