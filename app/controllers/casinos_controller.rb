class CasinosController < ApplicationController
  before_action :set_casino, only: [:show, :edit, :update, :destroy]

  # GET /casinos
  # GET /casinos.json
  def index
    @casinos = Casino.all
  end

  # GET /casinos/1
  # GET /casinos/1.json
  def show
  end

  # GET /casinos/new
  def new
    @casino = Casino.new
  end

  # GET /casinos/1/edit
  def edit
  end

  # POST /casinos
  # POST /casinos.json
  def create
    @casino = Casino.new(casino_params)

    respond_to do |format|
      if @casino.save
        format.html { redirect_to @casino, notice: 'Casino was successfully created.' }
        format.json { render :show, status: :created, location: @casino }
      else
        format.html { render :new }
        format.json { render json: @casino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casinos/1
  # PATCH/PUT /casinos/1.json
  def update
    respond_to do |format|
      if @casino.update(casino_params)
        format.html { redirect_to @casino, notice: 'Casino was successfully updated.' }
        format.json { render :show, status: :ok, location: @casino }
      else
        format.html { render :edit }
        format.json { render json: @casino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casinos/1
  # DELETE /casinos/1.json
  def destroy
    @casino.destroy
    respond_to do |format|
      format.html { redirect_to casinos_url, notice: 'Casino was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_casino
      @casino = Casino.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def casino_params
      params.require(:casino).permit(:name, :slug, :address, :latitude, :longitude, :content, :destination_id)
    end
end
