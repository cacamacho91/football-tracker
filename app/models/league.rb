class League < ActiveRecord::Base
  has_many :userleagues
  has_many :users, through: :userleagues
  belongs_to :countries

end
