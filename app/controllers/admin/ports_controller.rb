class Admin::PortsController < Admin::AdminController

	include ImageableBuilder

	before_action :set_port, only: [:edit, :update, :destroy]

	def index
		@ports = Port.all.page(params[:page])
		@items = @ports
		render template: 'admin/admin/shared_index'
	end

	def new
		@port = Port.new
		@port.pictures.build
		render :new_modal, layout: false if params[:modal].present?
	end

	def edit
		@port.pictures.build
	end

	def create
		@port = Port.new(port_params)
		respond_to do |format|
			if @port.save
				format.html { redirect_to edit_admin_port_path(@port), notice: 'Port was successfully created.' }
				format.json { render :show, status: :created, location: @port }
			else
				format.html { render :new }
				format.json { render json: @port.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @port.update(port_params)
				format.html { redirect_to edit_admin_port_path(@port), notice: 'Port was successfully updated.' }
				format.json { render :show, status: :ok, location: @port }
			else
				format.html { render :edit }
				format.json { render json: @port.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@port.destroy
		respond_to do |format|
			format.html { redirect_to admin_ports_url, notice: 'Port was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def set_port
		@port = Port.friendly.find(params[:id])
	end

	def port_params
		params.require(:port).permit(:name, :slug, :content, :location, :latitude, :longitude, pictures_attributes: picture_params)
	end

end
