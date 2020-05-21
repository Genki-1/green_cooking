class ReportsController < ApplicationController


  def new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    #投稿に紐づいたコメントを作成
    @reports = @recipe.reports.order(:created_at)
    @report = @recipe.reports.build(report_params)
    @new_report = Report.new
    @report.user_id = current_user.id
    @report.save
    render :index
  end

  def edit
  end

  def update
  end

  def destroy
    @new_report = Report.new
    @recipe = Recipe.find(params[:recipe_id])
    @report = Report.find(params[:id])
    @reports = @recipe.reports.order(:created_at)
    @report.destroy
    render :index
  end

  private
  def report_params
    params.require(:report).permit(:content, :image, :recipe_id, :user_id)
  end

end
