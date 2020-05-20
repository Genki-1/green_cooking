class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    #投稿に紐づいたコメントを作成
    @comments = @recipe.comments.order(:created_at)
    @comment = @recipe.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @comment = Comment.find(params[:id])
    @recipe = @comment.recipe
    @comments = @recipe.comments.order(:created_at)
    @comment.destroy
    render :index
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :recipe_id, :user_id)
  end

end
