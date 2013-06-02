class SessionsController < ApplicationController
  require "uri"
  require "net/http"
  
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id  
    user = Runkeeper.new("b79f7d90676141a0be726a890a40fad7")
    #user.fitness_activities
    #user.fitness_activities.parsed_response["items"].first["duration"]
    redirect_to root_url, notice: "Signed in."
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out."
  end
  
  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end

end
