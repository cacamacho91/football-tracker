require_relative './config/environment'
require 'sinatra/activerecord/rake'
# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  #turn off logging in console to aviod ruining user experience
  ActiveRecord::Base.logger = nil
  #ActiveRecord::Base.logger = Logger.new(STDOUT) #UNCOMMENT TO GET DB LOGGER
  Pry.start
end
