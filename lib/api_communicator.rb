require_relative '../config/environment.rb'

#(1) As a football fan I can see the current league table for the English Premier League
def show_prem_league_table
  response =  parse_api_request("https://api-football-v1.p.mashape.com/standings/37")
  table = response["api"]["standings"]
  table.each do |rank, team_data|
    puts "#{rank}. #{team_data["teamName"]} | #{team_data["play"]} | #{team_data["win"]} | #{team_data["draw"]} | #{team_data["lose"]} | #{team_data["points"]}   "
  end
end

#(2) As a football fan I can see all the fixtures for the English Premier League for today
def show_spurs_fixtures_2019
  response = parse_api_request("https://api-football-v1.p.mashape.com/fixtures/team/47")
  fixtures = response["api"]["fixtures"]
  fixtures.each do |id, fixture|
    puts "#{fixture["event_date"][0..9]} #{fixture["homeTeam"]} vs #{fixture["awayTeam"]} " if fixture["event_date"].include?("2019")
  end
end

#(3) As a football fan I want to see all of the current teams in the English Premier League for the current season
def show_all_prem_teams
  response =  parse_api_request("https://api-football-v1.p.mashape.com/teams/league/2")
  teams = response["api"]["teams"].map {|team| team[1]["name"]}
  puts teams.sort
end

#(4) As a Spurs fan I can find out who all of our players this season are
def show_spurs_players
  response =  parse_api_request("https://api-football-v1.p.mashape.com/players/2018/47")
  players = response["api"]["players"]
  players.each  {|player| puts player["player"]}
end

#(5) As a Spurs fan I can see the current stats of my team for today's league
def show_spurs_today_stats
  response = parse_api_request("https://api-football-v1.p.mashape.com/statistics/2/47")
  matches = response["api"]["stats"]["matchs"]
  puts "League Wins: Home:#{matches["wins"]["home"]} Away:#{matches["wins"]["away"]} "
  puts "League Losses: Home:#{matches["loses"]["home"]} Away:#{matches["loses"]["away"]} "
  puts "League Draws: Home:#{matches["draws"]["home"]} Away:#{matches["draws"]["away"]} "
end

def get_all_availble_countries
  response = parse_api_request("https://api-football-v1.p.mashape.com/countries")
  countries = response["api"]["countries"]
end

def get_leagues_by_country_name_and_year(name, year="2018")
  league_names_ids = {}
  response = parse_api_request("https://api-football-v1.p.mashape.com/leagues/country/#{name}/#{year}")
  leagues = response["api"]["leagues"].values
  leagues.each do |league|
    league_names_ids[league["league_id"]] = league["name"]
  end
  league_names_ids
end

def parse_api_request(url_endpoint)
  response = RestClient::Request.execute(
   :method => :get,
   :url => url_endpoint,
   :headers => {"X-Mashape-Key" => TEST_KEY,
   "Accept" => "application/json"
  })
  response_hash = JSON.parse(response)
end
