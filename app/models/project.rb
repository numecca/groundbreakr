class Project < ActiveRecord::Base
  attr_accessible :name, :country, :description, :profile_url, :avatar_url, :target_amount, :raised_amount

  validates_presence_of :name
  validates_presence_of :target_amount
  validates_presence_of :raised_amount

end
