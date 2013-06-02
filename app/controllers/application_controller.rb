class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def featured_fund
    @fund = Fund.all.sort_by{|a| a.raised_amount}.last
  end

  def runkeeper_user 
    @keeper_user = Runkeeper.new("b79f7d90676141a0be726a890a40fad7")
  end

  def database_user
    @user = User.find_by_name(runkeeper_user.name)
  end

  def update_progress_bar
    user_runs = runkeeper_user.fitness_activities.parsed_response["items"]
    if (database_user.run_count < user_runs.count)
      database_user.update_attribute(:run_count, user_runs.count)
      featured_fund.update_attribute(:raised_amount, featured_fund.raised_amount + miles_to_dollars_conversion(user_runs.first["total_distance"]))
      database_user.update_attribute(:total_distance, database_user.total_distance + (user_runs.first["total_distance"]/1609.34).round(3))
      database_user.update_attribute(:total_donated, database_user.total_donated + miles_to_dollars_conversion(user_runs.first["total_distance"]))
    end
  end


  def miles_to_dollars_conversion(total_meters)
    miles = (total_meters/1609.34).round(3)
    amount_to_fund = miles * 4000
  end


  helper_method :runkeeper_user
  helper_method :current_user
  helper_method :featured_fund
  helper_method :miles_to_dollars_conversion
  helper_method :update_progress_bar
  helper_method :total_distance
  helper_method :database_user
end
