class CommentsController < ApplicationController
  def index
  end

  def create
    @commentable = Post.find(params[:post_id])
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to @commentable
    else
      render @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
