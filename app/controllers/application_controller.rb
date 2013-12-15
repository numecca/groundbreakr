class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session[:user_id] = nil
      redirect_to root_path and return
    end
  end

  def current_project
    current_user.projects.last
  end

  def featured_project
    @project ||= Project.all.sort_by{|a| a.raised_amount}.last
  end

  def miles_to_dollars_conversion(total_meters)
    miles = (total_meters/1609.34).round(3)
    amount_to_project = miles * 4000
  end

  helper_method :current_user
  helper_method :current_project
end
