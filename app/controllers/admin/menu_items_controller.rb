class Admin::MenuItemsController < ApplicationController
  before_action :set_admin_menu_item, only: [:show, :edit, :update, :destroy]

  # GET /admin/menu_items
  # GET /admin/menu_items.json
  def index
    @admin_menu_items = Admin::MenuItem.all
  end

  # GET /admin/menu_items/1
  # GET /admin/menu_items/1.json
  def show
  end

  # GET /admin/menu_items/new
  def new
    @admin_menu_item = Admin::MenuItem.new
  end

  # GET /admin/menu_items/1/edit
  def edit
  end

  # POST /admin/menu_items
  # POST /admin/menu_items.json
  def create
    @admin_menu_item = Admin::MenuItem.new(admin_menu_item_params)

    respond_to do |format|
      if @admin_menu_item.save
        format.html { redirect_to @admin_menu_item, notice: 'Menu item was successfully created.' }
        format.json { render :show, status: :created, location: @admin_menu_item }
      else
        format.html { render :new }
        format.json { render json: @admin_menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/menu_items/1
  # PATCH/PUT /admin/menu_items/1.json
  def update
    respond_to do |format|
      if @admin_menu_item.update(admin_menu_item_params)
        format.html { redirect_to @admin_menu_item, notice: 'Menu item was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_menu_item }
      else
        format.html { render :edit }
        format.json { render json: @admin_menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/menu_items/1
  # DELETE /admin/menu_items/1.json
  def destroy
    @admin_menu_item.destroy
    respond_to do |format|
      format.html { redirect_to admin_menu_items_url, notice: 'Menu item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_menu_item
      @admin_menu_item = Admin::MenuItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_menu_item_params
      params.require(:admin_menu_item).permit(:href, :icon, :position, :text, :page_id, :blank_target)
    end
end
