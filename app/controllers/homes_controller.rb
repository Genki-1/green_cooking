class HomesController < ApplicationController
  def index
    @recipes=Recipe.all
  end

  def about
  end
end

