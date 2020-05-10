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
  end

  def followers
  end

  private
  def set_user
    @user = User.find_by(public_uid: params[:id])
  end

end
