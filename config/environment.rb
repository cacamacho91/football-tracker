#Require all external gems
require 'bundler/setup'
Bundler.require

require_relative '../lib/api_communicator.rb'
require_relative '../lib/command_line_interface.rb'

# requiring all model classes
require_relative '../app/models/country.rb'
require_relative '../app/models/league.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/userleague.rb'
require_relative '../app/models/team.rb'
require_relative '../app/models/userteam.rb'


#Set Environemnt Keys
PROD_KEY = "HSrTEEejMlmshr6vg2SjrZpz5Nw1p1qGN6RjsnXZ8zGR0o4j5j"
TEST_KEY = "O33pXS2rCjmsha0ZVTJZXNy3yCRsp1E9gY4jsn6OleTSPGrAKn"


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)
