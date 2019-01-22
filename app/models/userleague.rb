class UserLeague < ActiveRecord::Base
  belongs_to :users
  belongs_to :leagues
  has_many :countries, through: :leagues
end
