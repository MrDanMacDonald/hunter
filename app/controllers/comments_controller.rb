class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:reply, :create]
  respond_to :html, :js

  def index
  end

  def reply
    binding.pry
  end

  def create
    @commentable = Post.find(params[:post_id])
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
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
