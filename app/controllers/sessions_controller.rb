class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end 
  end

  def create_from_twitter
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    if user
      log_in user
      remember user
      redirect_to user
      flash.now[:success] = 'Signed in!'
    else
      flash.now[:danger] = 'Sign in not successful'
      redirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
