class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:reply, :create]
  respond_to :html, :js

  def index
  end

  def new
    binding.pry
    @comment = Comment.new
    @parent = Comment.find(params[:parent_id]) if params[:parent_id]
    @commentable = Post.find(params[:commentable])
  end

  def create
    if params[:parent_id].to_i > 0
      parent = Comment.find(params['parent_id'].delete('parent_id'))
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    @commentable = Post.find(params[:post_id])
    @comment.commentable = @commentable
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
    params.require(:comment).permit(:content, :parent_id)
  end
end
