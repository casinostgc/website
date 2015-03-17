class Admin::PagesController < Admin::AdminController

	before_action :set_page, only: [:edit, :update, :destroy]

	respond_to :html

	def index
		@pages = Page.all
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
		@page.destroy
		respond_with(@page)
	end

	private
	def set_page
		@page = Page.friendly.find(params[:id])
	end

	def page_params
		params.require(:page).permit(:title, :slug, :content, :status)
	end
end
