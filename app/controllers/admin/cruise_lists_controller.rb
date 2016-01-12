class Admin::CruiseListsController < Admin::AdminController

	before_action :set_cruise_list, except: [:index, :new, :create]
	before_action :set_nested_includes, only: [:new, :edit]

	def index
		@cruise_lists = CruiseList.all.page(params[:page])
	end

	def new
		@cruise_list = CruiseList.new
		build_nested
	end

	def edit
		build_nested
	end

	def create
		@cruise_list = CruiseList.new(cruise_list_params)

		respond_to do |format|
			if @cruise_list.save
				format.html { redirect_to edit_admin_cruise_list_path(@cruise_list), notice: 'Cruise list was successfully created.' }
				format.json { render :show, status: :created, location: @cruise_list }
			else
				format.html { render :new }
				format.json { render json: @cruise_list.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @cruise_list.update(cruise_list_params)
				format.html { redirect_to edit_admin_cruise_list_path(@cruise_list), notice: 'Cruise list was successfully updated.' }
				format.json { render :show, status: :ok, location: @cruise_list }
			else
				format.html { render :edit }
				format.json { render json: @cruise_list.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@cruise_list.destroy
		respond_to do |format|
			format.html { redirect_to admin_cruise_lists_url, notice: 'Cruise list was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

	def set_cruise_list
		@cruise_list = CruiseList.find(params[:id])
	end


	def cruise_list_params
		params.require(:cruise_list).permit(:title, :slug, :venue_id, :content, cruise_list_ports_attributes: [:id, :port_id, :arrival, :departure, :_destroy], cruise_list_dates_attributes: [:id, :departure_date, :_destroy])
	end

	def set_nested_includes
		@nested_includes = []
		@nested_includes << :cruise_list_dates
		@nested_includes << :cruise_list_ports
	end

	def build_nested
		@cruise_list.cruise_list_dates.build if @cruise_list.cruise_list_dates.empty?
		@cruise_list.cruise_list_ports.build if @cruise_list.cruise_list_ports.empty?
	end

end
