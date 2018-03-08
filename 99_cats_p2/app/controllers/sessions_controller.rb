class SessionsController < ApplicationController

  def new
    unless logged_in?
      render :new
    else
      flash[:errors] = ["YOU NEED TO LOG OUT FIRST. \n FOOL"]
      redirect_to cats_url
    end
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
      )

    if user
      login!(user)
      flash[:success] = "You up in this Catmittee"
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid kitty Credentials. No hairballs for you :["]
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
    flash[:success] = "You get out right meow!"
    redirect_to cats_url
  end
end
