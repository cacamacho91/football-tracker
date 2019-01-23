require_relative '../config/environment.rb'

#gets all countries availble in the api, returns an array of strings
def get_availble_countries
  response = parse_api_request("https://api-football-v1.p.mashape.com/countries")["countries"]
end

#gets all seasons availble in the api, returns as an array of strings
def get_availble_seasons
  response = parse_api_request("https://api-football-v1.p.mashape.com/seasons")["seasons"].values
end

#Takes a league id and returns all teams the api supports for that league
#  returns a hash in the format team_id => team_data
def get_teams_by_league(league_id)
  response =  parse_api_request("https://api-football-v1.p.mashape.com/teams/league/#{league_id}")["teams"]
end

#Creates a hash with the key as the league_id and the value as the league name
#  The country the league belongs to has been added due to multiple leagues
#  having the same name
def all_leagues_hash(season="2018")
  leagues = {}
  response = parse_api_request("https://api-football-v1.p.mashape.com/leagues/season/#{season}")["leagues"].values
  response.each do |league_data|
    leagues[league_data["league_id"]] = "#{league_data["country"]} - #{league_data["name"]}"
  end
  leagues
end

#Creates a hash with the key as the team_id and the value as the team name
#  Only includes teams from an array of provided leagues
def all_teams_hash_by_leagues(league_ids)
  teams = {}
  league_ids.each do |league_id|
    teams_in_league = parse_api_request("https://api-football-v1.p.mashape.com/teams/league/#{league_id}")["teams"]
    teams_in_league.each {|team_data|
      teams[team_data[1]["team_id"]] = team_data[1]["name"]}
  end
  teams
end

#returns a team name when given a team_id
def get_team_name_by_id(team_id)
  response = parse_api_request("https://api-football-v1.p.mashape.com/teams/team/#{team_id}")["teams"].values.first["name"]
end

#returns a league name when given a league_id
def get_league_name_by_id(league_id)
  response = parse_api_request("https://api-football-v1.p.mashape.com/leagues/league/#{league_id}")["leagues"].values.first["name"]
end

#returns an league table for a given league_id
def get_league_standings_by_league(league_id)
  response =  parse_api_request("https://api-football-v1.p.mashape.com/standings/#{league_id}")["standings"]
end

#show all fixtures for a given team
def get_team_fixtures(team_id)
  response = parse_api_request("https://api-football-v1.p.mashape.com/fixtures/team/#{team_id}")["fixtures"]
end

#Show all players by team id
def get_players_by_team(team_id)
  response =  parse_api_request("https://api-football-v1.p.mashape.com/players/2018/#{team_id}")["players"]
end


#Helper method to call api with given endpoint and TEST keys and parse result
def parse_api_request(url_endpoint)
  response = RestClient::Request.execute(
   :method => :get,
   :url => url_endpoint,
   :headers => {"X-Mashape-Key" => TEST_KEY,
   "Accept" => "application/json"
  })
  response_hash = JSON.parse(response)["api"]
end
