class PagesController < ApplicationController
  before_action :set_page, except: []

  respond_to :html

  def show
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
