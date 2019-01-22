#Require all external gems
require 'bundler/setup'
Bundler.require

require_all 'lib/'
require_all 'app/'


#Set Environemnt Keys
PROD_KEY = "HSrTEEejMlmshr6vg2SjrZpz5Nw1p1qGN6RjsnXZ8zGR0o4j5j"
TEST_KEY = "O33pXS2rCjmsha0ZVTJZXNy3yCRsp1E9gY4jsn6OleTSPGrAKn"


ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)
