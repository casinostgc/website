class Admin::MenuItemsController < Admin::AdminController
	before_action :set_menu_item, only: [:edit, :update, :destroy]
	before_action :set_pages, except: [:sort]
	before_action :set_icons, except: [:sort]

	respond_to :html

	def index
		@menu_items = MenuItem.all
		respond_with(@menu_items)
	end

	def sort
		params[:menu_item].each_with_index do |id, index|
			MenuItem.where(id: id).update_all(position: index+1)
		end
		render nothing: true
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
				format.html { redirect_to admin_menu_items_path }
				# format.xml { render xml: @menu_item }
			else
				format.html { render action: "new" }
				# format.xml { render xml: @menu_item }
			end
		end
	end

	def update
		respond_to do |format|
			if @menu_item.update(menu_item_params)
				format.html { redirect_to admin_menu_items_path, notice: 'Menu item was successfully updated.' }
				# format.json { render :show, status: :ok, location: @tire_type }
			else
				format.html { render :edit }
				# format.json { render json: @tire_type.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@menu_item.destroy
		redirect_to admin_menu_items_path, notice: 'Menu item was successfully destroyed.'
	end

	private
	def set_menu_item
		@menu_item = MenuItem.find(params[:id])
	end

	def set_pages
		@pages = Page.order(:title)
	end

	def set_icons
		file = File.read("#{Rails.root}/vendor/assets/stylesheets/fa-4.3.0/_variables.scss")
		icons = Array.new
		file.scan(/fa-var-(.*?)\:/).each do |icon|
			icons.push(icon.first.to_s)
		end
		@icons = icons
	end

	def menu_item_params
		params.require(:menu_item).permit(:href, :value, :icon, :position, :page_id, :blank_target)
	end
end
