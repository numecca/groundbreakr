class UsersController < ApplicationController

  def home
    @wishbone = WishboneAPI.sort_by_funding
  end

  private

end
