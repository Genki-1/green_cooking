class HomesController < ApplicationController
  def index
    @all_ranks = Recipe.joins(:likes).group(:recipe_id)
    if user_signed_in?
      if current_user.is_meat_status
        @recipes = @recipes.where.not(is_meat_status: true)
        @all_ranks = @all_ranks.where.not(is_meat_status: true)
      end
      if current_user.is_fish_status
        @recipes = @recipes.where.not(is_fish_status: true)
        @all_ranks = @all_ranks.where.not(is_fish_status: true)
      end
      if current_user.is_egg_status
        @recipes = @recipes.where.not(is_egg_status: true)
        @all_ranks = @all_ranks.where.not(is_egg_status: true)
      end
      if current_user.is_dairy_products_status
        @recipes = @recipes.where.not(is_dairy_products_status: true)
        @all_ranks = @all_ranks.where.not(is_dairy_products_status: true)
      end
    end
    @page_recipes = @recipes.page(params[:page]).per(5)
    food_like_count = @all_ranks.count
    food_liked_ids = Hash[food_like_count.sort_by{ |_, v| -v }].keys
    @ranking_recipes = []
    recipes = Recipe.where(id: food_liked_ids)
    food_liked_ids[0..2].each do |id|
      @ranking_recipes << recipes.detect { |r| r.id == id }
    end
  end

  def about
  end
end
