class UsersController < ApplicationController
  respond_to :html, :js

  def show
    @user = User.find(params[:id])
    @upvoted_posts = @user.find_up_voted_items
    @submitted_posts = @user.posts
    @followers = @user.followers
    @following = @user.following
    @post = Post.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash.now[:success] = 'Welcome!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @upvoted_posts = @user.find_up_voted_items
    if @user.update_attributes(user_params)
      flash.now[:success] = 'Profile Updated!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :photo, :password, :password_confirmation)
  end
end
