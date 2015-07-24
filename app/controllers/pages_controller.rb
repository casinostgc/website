class PagesController < ApplicationController
	
	before_action :set_page, only: [:show, :edit, :update, :destroy]

	def index
		@pages = Page.all
	end

	def root
		@page = Page.where(front_page: true).try(:first)
		@page.nil? ? render('static_pages/index') : render(:show)
	rescue
		render('static_pages/index')
	end

	def show
	end

	private
	
	def set_page
		@page = Page.friendly.find(params[:id])
	end
	
end
