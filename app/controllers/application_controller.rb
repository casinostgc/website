class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_ransacks

  def set_ransacks
  	@flights_q = Flight.ransack(params[:q])
  end

  def after_sign_in_path_for(resource)
  	admin_admin_path
  end

end
