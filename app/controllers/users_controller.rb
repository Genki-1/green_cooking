class UsersController < ApplicationController
  def index
  end

  def show
    @user  = User.find(params[:id])
    @recipes = Recipe.where(user_id: @user.id)
  end

  def edit
    @user  = User.find(params[:id])
  end

  def update
  end

  def confirm
  end

  def hide
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  def recipes
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: @user.id)
  end

  def likes
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
