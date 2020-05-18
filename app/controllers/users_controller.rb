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
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
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
    @user = User.find(params[:id])
    @recipes = @user.like_recipes.includes(:user)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname,:profile_image, :profile_text)
  end

end
