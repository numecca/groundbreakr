class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def featured_fund
    @fund = Fund.first
  end

  def runkeeper_user 
    @keeper_user = Runkeeper.new("b79f7d90676141a0be726a890a40fad7")
    @user = User.find_by_name(@keeper_user.name)
  end

  helper_method :runkeeper_user
  helper_method :current_user
  helper_method :featured_fund
end
