class UsersController < ApplicationController

  def home
    @wishbone = WishboneAPI.unfunded
  end

  private

end
