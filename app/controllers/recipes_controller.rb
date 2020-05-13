class RecipesController < ApplicationController
  def index
    @recipes=Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
    @makes = @recipe.makes.build
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def recipe_params
    params.require(:recipe).permit(:user_id, :title, :description, :point, :main_image_id, :is_meat_status, :is_fish_status, :is_egg_status, :is_dairy_products_status, ingredients_attributes: [:id, :name, :quantity, :_destroy], makes_attributes: [:id, :process, :image_id, :_destroy])
  end

end

