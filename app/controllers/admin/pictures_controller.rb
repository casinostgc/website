class Admin::PicturesController < Admin::AdminController

	before_action :set_picture, only: [:edit, :update, :destroy]

	respond_to :html

	def index
		@pictures = Picture.all.page(params[:picture])
		respond_with(@pictures)
	end

	def new
		@picture = Picture.new
		respond_with(@picture)
	end

	def edit
	end

	def create
		@picture = Picture.new(picture_params)
		@picture.save
		respond_with(@picture)
	end

	def update
		@picture.update(picture_params)
		respond_with(@picture)
	end

	def destroy
		@picture.destroy
		redirect_to admin_pictures_path
	end

	private
	def set_picture
		@picture = Picture.find(params[:id])
	end

	def picture_params
		params.require(:picture).permit(:name)
	end

end