class Fund < ActiveRecord::Base
  attr_accessible :name, :country, :description, :profile_url, :avatar_url, :target_amount, :raised_amount
  
end
