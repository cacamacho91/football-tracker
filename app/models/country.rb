class Country < ActiveRecord::Base
  has_many :leagues
  has_many :userleagues, through: :leagues
end
