class Admin::CasinosController < Admin::AdminController

	include PictureBuilder

	before_action :set_casino, only: [:edit, :update, :destroy]

	def index
		@casinos = Casino.all
	end

	def new
		@casino = Casino.new
		build_pictures @casino
	end

	def edit
		build_pictures @casino
	end

	def create
		@casino = Casino.new(casino_params)

		respond_to do |format|
			if @casino.save
				format.html { redirect_to @casino, notice: 'Casino was successfully created.' }
				format.json { render :show, status: :created, location: @casino }
			else
				format.html { render :new }
				format.json { render json: @casino.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @casino.update(casino_params)
				format.html { redirect_to @casino, notice: 'Casino was successfully updated.' }
				format.json { render :show, status: :ok, location: @casino }
			else
				format.html { render :edit }
				format.json { render json: @casino.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@casino.destroy
		respond_to do |format|
			format.html { redirect_to admin_casinos_url, notice: 'Casino was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def set_casino
		@casino = Casino.friendly.find(params[:id])
	end

	def casino_params
		params.require(:casino).permit(:name, :slug, :address, :content, pictures_attributes: picture_params)
	end
end
