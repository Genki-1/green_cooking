class ApplicationController < ActionController::Base

  before_action :set_search

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def set_search
    @q = Recipe.ransack(params[:q])
    @recipes = @q.result(distinct: true)
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end
