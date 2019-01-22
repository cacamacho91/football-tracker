#!/usr/bin/env ruby
require_relative '../config/environment.rb'

welcome

# prompt = TTY::Prompt.new
# name = prompt.ask('What is your name?', default: ENV['USER'])
# puts "Hi #{name}, time to set up your favourite football teams "
# countries = get_all_availble_countries
#
# chosen_country = prompt.select("Choose your country?", countries.values)
#
# leagues = get_leagues_by_country_name_and_year(chosen_country)
# chosen_leagues = prompt.multi_select("Great choice, which league(s) in #{chosen_country} would you like to follow? (you can select multiple using the space bar)", leagues.values)
#
#
# prompt.yes?("You have selected #{chosen_leagues}, from #{chosen_country}, are you happy with this?")
