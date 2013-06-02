class WelcomeController < ApplicationController

  def index
    if current_user
      @user = Runkeeper.new("b79f7d90676141a0be726a890a40fad7")
    end
  end
end