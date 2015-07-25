class TestimonialsController < ApplicationController
	
	before_action :set_testimonial, only: [:show]

	def index
		@testimonials = Testimonial.approved
	end

	def show
	end

	def new
		@testimonial = Testimonial.new
	end

	def create
		@testimonial = Testimonial.new(testimonial_params)

		respond_to do |format|
			if @testimonial.save
				format.html { redirect_to @testimonial, notice: 'Testimonial was successfully created.' }
				format.json { render :show, status: :created, location: @testimonial }
			else
				format.html { render :new }
				format.json { render json: @testimonial.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def set_testimonial
		@testimonial = Testimonial.find(params[:id])
		redirect_to testimonials_path unless @testimonial.approved
	end

	def testimonial_params
		params.require(:testimonial).permit(:name, :subject, :content, :gotcha)
	end

end
