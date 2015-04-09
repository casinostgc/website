class Admin::PagesController < Admin::AdminController

	before_action :set_page, except: [:index, :new, :create]

	respond_to :html

	def index
		@pages = Page.all.page(params[:page])
		respond_with(@pages)
	end

	def new
		@page = Page.new
		respond_with(@page)
	end

	def edit
	end

	def create
		@page = Page.new(page_params)
		@page.save
		respond_with(@page)
	end

	def update
		@page.update(page_params)
		respond_with(@page)
	end

	def destroy
		MenuItem.destroy_all(page: @page)
		@page.destroy
		redirect_to admin_pages_path
		# respond_to do |format|
		# 	if @page.destroy
		# 		format.html { redirect_to admin_pages_path, notice: 'Page was successfully destroyed.' }
		# 		format.json { head :no_content }
		# 	else
		# 		format.html { redirect_to admin_pages_path, notice: 'Page was not destroyed.' }
		# 	end
		# end
	end

	private
	def set_page
		@page = Page.friendly.find(params[:id])
	end

	def page_params
		params.require(:page).permit(:title, :content, :status)
	end
end
