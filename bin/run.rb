#!/usr/bin/env ruby
require_relative '../config/environment.rb'

prompt = TTY::Prompt.new

welcome_text

#####IF USER NOT RECOGNISED BEGIN WELCOME FLOW####
pick_country_text
chosen_country = prompt.select("Choose your country?", get_availble_countries.values)

pick_league_text
chosen_league = prompt.select("Which league from that counties would you like to follow?", show_league_by_country(chosen_country))

pick_teams_text
chosen_teams = prompt.multi_select("Which team from that league would you like to support?",show_teams_by_league(chosen_league.split('#')[1]))

puts chosen_teams
