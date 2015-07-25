class Admin::TestimonialsController < Admin::AdminController
	
	before_action :set_testimonial, only: [:edit, :update, :destroy]

	def index
		@testimonials = Testimonial.all.page(params[:page])
	end

	def new
		@testimonial = Testimonial.new approved: true
	end

	def edit
	end

	def create
		@testimonial = Testimonial.new(testimonial_params)

		respond_to do |format|
			if @testimonial.save
				format.html { redirect_to edit_admin_testimonial_path(@testimonial), notice: 'Testimonial was successfully created.' }
				format.json { render :show, status: :created, location: @testimonial }
			else
				format.html { render :new }
				format.json { render json: @testimonial.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @testimonial.update(testimonial_params)
				format.html { redirect_to edit_admin_testimonial_path(@testimonial), notice: 'Testimonial was successfully updated.' }
				format.json { render :show, status: :ok, location: @testimonial }
			else
				format.html { render :edit }
				format.json { render json: @testimonial.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@testimonial.destroy
		respond_to do |format|
			format.html { redirect_to admin_testimonials_url, notice: 'Testimonial was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def set_testimonial
		@testimonial = Testimonial.find(params[:id])
	end

	def testimonial_params
		params.require(:testimonial).permit(:name, :subject, :content, :approved)
	end

end
