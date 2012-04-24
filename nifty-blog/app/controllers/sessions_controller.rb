class SessionsController < ApplicationController
  def create
    user = login(params[:username], params[:password])
    if user
      redirect_back_or_to posts_url, :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to posts_url, :notice => "Logged out!"
  end
end
