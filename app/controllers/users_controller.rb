class UsersController < ApplicationController
  respond_to :html, :js

  def show
    @user = User.find(params[:id])
    @upvotedPosts = @user.find_up_voted_items
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome!'
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
    @upvotedPosts = @user.find_up_voted_items
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile Updated!'
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