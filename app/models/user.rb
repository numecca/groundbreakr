class User < ActiveRecord::Base
  has_many :access_grants, dependent: :destroy
  has_many :sponsorables
  has_many :projects, through: :sponsorables
  validates :name, presence: true

  attr_accessible :email, :name, :photo_url

  def current_project
    projects.last
  end

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
      user.photo_url = auth["info"]["image"] if auth["info"].has_key?("image")
      user.photo_url = auth["extra"]["raw_info"]["normal_picture"] if auth["extra"]["raw_info"].has_key?("normal_picture")
      user.run_count = 0
    end
    user.access_grants.create!(auth.slice("provider", "uid").merge(omniauth_token: auth["credentials"]["token"]))
    user
  end

  def runkeeper_user
    grant = access_grants.where(provider: 'runkeeper').first
    grant ? @keeper_user ||= Runkeeper.new(grant.omniauth_token) : nil
  end

  def sync_runs_with_runkeeper
    if runkeeper_user
      runkeeper_items = runkeeper_user.fitness_activities.parsed_response["items"]
      if (run_count < runkeeper_items.count)
        update_attribute(:run_count, user_runs.count)
        update_attribute(:total_distance, total_distance + (user_runs.first["total_distance"]/1609.34).round(3))
      end
    end
  end

end
