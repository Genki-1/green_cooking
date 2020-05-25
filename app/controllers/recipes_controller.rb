class RecipesController < ApplicationController

  before_action :ensure_correct_recipe_user, only: [:edit, :update, :destroy]

  before_action :login_check, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments.order(:created_at)
    @comment = Comment.new
    @reports = @recipe.reports.order(:created_at)
    @report = Report.new
  end

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build
    @makes = @recipe.makes.build
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.user_id=current_user.id
    if recipe.save
      redirect_to recipes_path
    else
      @recipe = recipe
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @makes = @recipe.makes
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      @ingredients = @recipe.ingredients
      @makes = @recipe.makes
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:user_id, :title, :description, :point, :main_image, :number_of_people, :is_meat_status, :is_fish_status, :is_egg_status, :is_dairy_products_status, ingredients_attributes: [:id, :name, :quantity, :_destroy], makes_attributes: [:id, :process, :image, :_destroy])
  end

  def login_check
      unless user_signed_in?
        redirect_to ("/users/sign_in")
      end
  end

  def ensure_correct_recipe_user
    @recipe = Recipe.find(params[:id])
    if user_signed_in?
      if current_user.id !=  @recipe.user.id
       redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

end
