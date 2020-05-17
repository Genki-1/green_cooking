class LikesController < ApplicationController

  before_action :recipe_params

  def index
  end

  def create
    like = current_user.likes.new(recipe_id: @recipe.id)
    like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, recipe_id: @recipe.id).destroy
  end

  private
  def recipe_params
    @recipe = Recipe.find(params[:recipe_id])
  end

end
