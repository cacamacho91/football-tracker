require_relative '../config/environment.rb'

#gets all seasons availble in the api, returns as an array of strings
def get_availble_seasons
  response = parse_api_request("https://api-football-v1.p.mashape.com/seasons")
  response["seasons"].values
end

#returns a league table for a given league_id
def show_league_standings_by_league(league_id)
  response =  parse_api_request("https://api-football-v1.p.mashape.com/standings/#{league_id}")
  table = response["standings"]
  table.each do |rank, team_data|
    puts "#{rank}. #{team_data["teamName"]} | #{team_data["play"]} | #{team_data["win"]} | #{team_data["draw"]} | #{team_data["lose"]} | #{team_data["points"]}   "
  end
end

#show fixtures for a given team and year, some years although valid by API have no matches
def show_team_fixtures_by_year(team_id, year="2019")
  return "Year not valid, must be one of: #{get_availble_seasons}" if !get_availble_seasons.include?(year)
  response = parse_api_request("https://api-football-v1.p.mashape.com/fixtures/team/#{team_id}")
  fixtures = response["fixtures"]
  matches = 0
  fixtures.each do |id, fixture|
    if fixture["event_date"].include?(year)
      puts "#{fixture["event_date"][0..9]} #{fixture["homeTeam"]} vs #{fixture["awayTeam"]} "
      matches += 1
    end
  end
  "#{matches} found"
end

#Show all teams by league_id
def show_all_teams_by_league(league_id)
  response =  parse_api_request("https://api-football-v1.p.mashape.com/teams/league/#{league_id}")
  teams = response["teams"].map {|team| team[1]["name"]}
  puts teams.sort
end

#Show all players by team id
def show_players_by_team(team_id)
  response =  parse_api_request("https://api-football-v1.p.mashape.com/players/2018/#{team_id}")
  players = response["players"]
  players.each  {|player| puts player["player"]}
end

#show a teams statistics for a given team / league
def show_team_stats_by_team_and_league(league_id, team_id)
  response = parse_api_request("https://api-football-v1.p.mashape.com/statistics/#{league_id}/#{team_id}")
  matches = response["stats"]["matchs"]
  puts "League Wins: Home:#{matches["wins"]["home"]} Away:#{matches["wins"]["away"]} "
  puts "League Losses: Home:#{matches["loses"]["home"]} Away:#{matches["loses"]["away"]} "
  puts "League Draws: Home:#{matches["draws"]["home"]} Away:#{matches["draws"]["away"]} "
end

def get_all_availble_countries
  response = parse_api_request("https://api-football-v1.p.mashape.com/countries")
  countries = response["countries"]
end

def get_leagues_by_country_name_and_year(name, year="2018")
  league_names_ids = {}
  response = parse_api_request("https://api-football-v1.p.mashape.com/leagues/country/#{name}/#{year}")
  leagues = response["leagues"].values
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
  response_hash = JSON.parse(response)["api"]
end
