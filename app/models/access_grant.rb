class AccessGrant < ActiveRecord::Base
  belongs_to :user
  attr_accessible :omniauth_token, :provider, :uid

end
