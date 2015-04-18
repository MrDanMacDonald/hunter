class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_date_and_posts
  respond_to :html, :js

  def index
    @posts_by_date = Post.order('created_at DESC').all.group_by { |post| post.created_at.to_date }
    current_user ? @post = current_user.posts.build : @post = Post.new
  end

  def upvote
    if logged_in?
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
    else
      flash[:danger] = 'Please sign in to do that!'
      render :js => "window.location = '/posts'"
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
    current_user ? @new_post = current_user.posts.build : @new_post = Post.new
  end

  private

  def set_date_and_posts
    @todays_date = Time.now.to_date
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:name, :url, :description)
  end
end
