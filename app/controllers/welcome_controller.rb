class WelcomeController < ApplicationController

  def index
    @funds = Fund.all.sort_by{|a| a.raised_amount}.last(3)
    
    if current_user
      @keeper_user = Runkeeper.new("b79f7d90676141a0be726a890a40fad7")
      @user = User.find_by_name(@keeper_user.name)
      @user_runs = @keeper_user.fitness_activities.parsed_response["items"]
      if (@user.run_count < @user_runs.count)
        @user.update_attribute(:run_count, @user_runs.count)
      end
    end
  end
end