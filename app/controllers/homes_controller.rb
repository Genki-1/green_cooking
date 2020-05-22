class HomesController < ApplicationController
  def index
    @recipes=Recipe.all
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

  def about
  end
end

