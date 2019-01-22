class Country < ActiveRecord::Base
  has_many :leagues
  has_many :user_leagues, through: :leagues
end
