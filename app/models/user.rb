class User < ActiveRecord::Base
  validates :name, presence: true

  attr_accessible :email, :name

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.run_count = 0
    end
  end

  def self.update_fund(number_of_runs)
    update_attribute(:run_count, number_of_runs)
  end

end
