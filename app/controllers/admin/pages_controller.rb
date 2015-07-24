class Admin::PagesController < Admin::AdminController

	before_action :set_page, except: [:index, :new, :create]

	def index
		@pages = Page.all.page(params[:page])
	end

	def new
		@page = Page.new
	end

	def edit
	end

	def create
		@page = Page.new(page_params)

		respond_to do |format|
			if @page.save
				format.html { redirect_to edit_admin_page_path(@page), notice: 'Page was successfully created.' }
				format.json { render :show, status: :created, location: @page }
			else
				format.html { render :new }
				format.json { render json: @page.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @page.update(page_params)
				format.html { redirect_to edit_admin_page_path(@page), notice: 'Page was successfully updated.' }
				format.json { render :show, status: :ok, location: @page }
			else
				format.html { render :edit }
				format.json { render json: @page.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@page.destroy
		respond_to do |format|
			format.html { redirect_to admin_pages_url, notice: 'Page was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	
	def set_page
		@page = Page.friendly.find(params[:id])
	end

	def page_params
		params.require(:page).permit(:title, :content, :front_page, :container_layout)
	end
end
