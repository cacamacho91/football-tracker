#Require all external gems
require 'bundler/setup'
Bundler.require

require_all 'lib/'
require_all 'app/'
require_all 'config/'

#turn off logging in console to aviod ruining user experience
ActiveRecord::Base.logger = nil

#Set Environemnt Keys
PROD_KEY = Config.football_api_prod
TEST_KEY = Config.football_api_test

#Set user as blank
$user = ""

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)
