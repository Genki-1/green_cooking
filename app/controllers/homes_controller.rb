class HomesController < ApplicationController
  def index
    @recipes=Recipe.all
    @recipes = Recipe.page(params[:page]).per(5)
  end

  def about
  end
end

