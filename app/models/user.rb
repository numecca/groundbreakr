class User < ActiveRecord::Base
  validates :name, presence: true
  has_many :access_grants

  attr_accessible :email, :name, :photo_url

  def self.from_omniauth(auth)
    grant = AccessGrant.where(auth.slice("provider", "uid")).first
    if grant
      grant.user
    else
      User.create_from_omniauth(auth)
    end
  end

  def self.create_from_omniauth(auth)
    user = User.create! do |user|
      user.name = auth["info"]["name"]
      user.photo_url = auth["extra"]["raw_info"]["normal_picture"]
      user.run_count = 0
    end
    user.access_grants.create!(auth.slice("provider", "uid").merge(omniauth_token: auth["credentials"]["token"]))
    user
  end

  def self.update_fund(number_of_runs)
    update_attribute(:run_count, number_of_runs)
  end

end
