class UsersController < ApplicationController
  def index
  end

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
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def following
    #@userがフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.following
    @page_users = @users.page(params[:page]).per(2)
  end

  def followers
    #@userをフォローしているユーザー
    @user  = User.find(params[:id])
    @users = @user.followers
    @page_users = @users.page(params[:page]).per(2)
  end

  def recipes
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: @user.id)
    @page_recipes = @recipes.page(params[:page]).per(2)
  end

  def likes
    @user = User.find(params[:id])
    @recipes = @user.like_recipes.includes(:user)
    @page_recipes = @recipes.page(params[:page]).per(2)
  end

  def reports
    @user = User.find(params[:id])
    @reports = Report.where(user_id: @user.id)
    @page_reports = @reports.page(params[:page]).per(2)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname,:profile_image, :profile_text)
  end

end
