class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :upvote, :destroy]
  respond_to :html, :js

  def index
    @date = Time.now
    @posts = Post.all
  end

  def new
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to :back
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post submitted!'
      redirect_to posts_path
    else
      render 'static_pages/home'
    end
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @post.comments
    @comment = Comment.new
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:name, :url, :description)
  end
end
