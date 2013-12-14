class WelcomeController < ApplicationController

  def index
    redirect_to home_path and return if current_user
    @projects = Project.all.sort_by{|a| a.raised_amount}.last(3)
    @completed_projects= Project.all.sort_by{|a| a.raised_amount}.first(3)
  end
end
