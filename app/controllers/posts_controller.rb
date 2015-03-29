class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :upvote, :destroy]
  before_action :set_date_and_posts
  respond_to :html, :js

  def index
    if logged_in?
      @post = current_user.posts.build
    else
      @post = Post.new
    end
  end

  def upvote
    @post = Post.find(params[:id])
    respond_to do |format|
      unless current_user.voted_for? @post
        format.html { redirect_to(@post) }
        format.js
        @post.upvote_by current_user
      else
        format.html { redirect_to(@posts) }
        format.js
      end
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash.now[:success] = 'Post submitted!'
      redirect_to posts_path
    else
      flash.now[:danger] = 'This resource has already been posted'
      render 'posts/index'
    end
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @post.comments.hash_tree
    @comment = Comment.new
  end

  private

  def set_date_and_posts
    @date = Time.now
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:name, :url, :description)
  end
end
