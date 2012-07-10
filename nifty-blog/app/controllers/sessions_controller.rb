class SessionsController < ApplicationController
  skip_before_filter :require_login, :except => [:destroy]

  def create
    user = login(params[:username], params[:password])
    if user
      redirect_back_or_to posts_url, :notice => "Logged in!"
    else
      flash.now.alert = "Username or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to posts_url, :notice => "Logged out!"
  end
end
