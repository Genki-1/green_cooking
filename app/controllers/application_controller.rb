class ApplicationController < ActionController::Base

  before_action :set_search

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def set_search
    @q = Recipe.ransack(params[:q])

    @recipes = @q.result(distinct: true)
    if user_signed_in?
      if current_user.is_meat_status
        @recipes = @recipes.where.not(is_meat_status: true)
      end
      if current_user.is_fish_status
        @recipes = @recipes.where.not(is_fish_status: true)
      end
      if current_user.is_egg_status
        @recipes = @recipes.where.not(is_egg_status: true)
      end
      if current_user.is_dairy_products_status
        @recipes = @recipes.where.not(is_dairy_products_status: true)
      end
    end
    @page_recipes = @recipes.page(params[:page]).per(5)
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end