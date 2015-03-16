class MenuItemsController < ApplicationController
	before_action :set_menu_item, only: [:edit, :update, :destroy]
	before_action :set_pages, only: [:edit, :new]

	respond_to :html

	def index
		@menu_items = MenuItem.all
		respond_with(@menu_items)
	end

	def new
		@menu_item = MenuItem.new
		respond_with(@menu_item)
	end

	def edit
	end

	def create
		@menu_item = MenuItem.new(menu_item_params)
		respond_to do |format|
			if @menu_item.save
				flash[:notice] = 'Menu item was successfully created.'
				format.html { redirect_to menu_items_path }
				format.xml { render xml: @menu_item }
			else
				format.html { render action: "new" }
				format.xml { render xml: @menu_item }
			end
		end
	end

	def update
		respond_to do |format|
			if @menu_item.update(menu_item_params)
				format.html { redirect_to menu_items_path, notice: 'Menu item was successfully updated.' }
				# format.json { render :show, status: :ok, location: @tire_type }
			else
				format.html { render :edit }
				# format.json { render json: @tire_type.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@menu_item.destroy
		respond_with(@menu_item)
	end

	private
	def set_menu_item
		@menu_item = MenuItem.find(params[:id])
	end

	def set_pages
		@pages = Page.order(:title)
	end

	def menu_item_params
		params.require(:menu_item).permit(:href, :value, :icon, :position)
	end
end
