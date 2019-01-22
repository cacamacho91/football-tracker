class User < ActiveRecord::Base
  has_many :userleagues
  has_many :leagues, through: :userleagues
end
