class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    # TODO: Redirect to user show page
    redirect_to home_path, notice: "Signed in."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

end
