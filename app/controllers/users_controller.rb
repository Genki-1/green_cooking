class UsersController < ApplicationController
  def index
  end

  def show
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
    @user = User.find_by(public_uid: params[:id])
  end

end
