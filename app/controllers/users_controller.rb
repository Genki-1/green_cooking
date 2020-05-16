class UsersController < ApplicationController
  def index
  end

  def show
    @user  = User.find(params[:id])
    @recipes = Recipe.where(user_id: @user.id)
  end

  def edit
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
    render 'show_follow'
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
