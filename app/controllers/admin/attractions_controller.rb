class Admin::AttractionsController < Admin::AdminController

	before_action :set_attraction, only: [:show, :edit, :update, :destroy]

	def index
		@attractions = Attraction.all.page(params[:page])
		@items = @attractions
		render template: 'admin/admin/shared_index'
	end

	def new
		@attraction = Attraction.new
	end

	def edit
	end

	def create
		@attraction = Attraction.new(attraction_params)

		respond_to do |format|
			if @attraction.save
				format.html { redirect_to edit_admin_attraction_path(@attraction), notice: 'Attraction was successfully created.' }
				format.json { render :show, status: :created, location: @attraction }
			else
				format.html { render :new }
				format.json { render json: @attraction.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @attraction.update(attraction_params)
				format.html { redirect_to edit_admin_attraction_path(@attraction), notice: 'Attraction was successfully updated.' }
				format.json { render :show, status: :ok, location: @attraction }
			else
				format.html { render :edit }
				format.json { render json: @attraction.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@attraction.destroy
		respond_to do |format|
			format.html { redirect_to admin_attractions_url, notice: 'Attraction was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end

	def attraction_params
		params.require(:attraction).permit(:name, :content)
	end

end
