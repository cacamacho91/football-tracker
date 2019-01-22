class League < ActiveRecord::Base
  has_many :user_leagues
  has_many :users, through: :user_leagues
  belongs_to :country
end
