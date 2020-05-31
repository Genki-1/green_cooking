class UsersController < ApplicationController

  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user  = User.find(params[:id])
    @recipes = Recipe.where(user_id: @user.id)
    @reports = Report.where(user_id: @user.id)
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
    #is_member_statusカラムにフラグを立てる(defaultはfalse)
    current_user.update(is_member_status: true)
    #ログアウトさせる
    reset_session
    redirect_to root_path
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
    @page_users = @users.page(params[:page]).per(10).order(created_at: :desc)
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    @page_users = @users.page(params[:page]).per(10).order(created_at: :desc)
  end

  def recipes
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: @user.id)
    @page_recipes = @recipes.page(params[:page]).per(5).order(created_at: :desc)
  end

  def likes
    @user = User.find(params[:id])
    @recipes = @user.like_recipes.includes(:user)
    @page_recipes = @recipes.page(params[:page]).per(5).order(created_at: :desc)
  end

  def reports
    @user = User.find(params[:id])
    @reports = Report.where(user_id: @user.id)
    @page_reports = @reports.page(params[:page]).per(5).order(created_at: :desc)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname,:profile_image, :profile_text, :is_meat_status, :is_fish_status, :is_egg_status, :is_dairy_products_status)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if user_signed_in?
      if @user.id != current_user.id
       redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

end
