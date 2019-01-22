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

#Takes a country name and returns all leagues the api supports for that country
#  returns a hash in the format league_id => league_data
def get_leagues_by_country_name(name)
  response = parse_api_request("https://api-football-v1.p.mashape.com/leagues/country/#{name}")["leagues"]
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


# #gets hash of all availble leagues supported by the api in format leaue_name => league_id
# def get_availble_leagues_hash
#   league_hash = {}
#   response = parse_api_request("https://api-football-v1.p.mashape.com/leagues")["leagues"].values
#   response.each { |league_data| league_hash[league_data["name"]] = league_data["league_id"] }
#   binding.pry
# end



# #returns an league table for a given league_id
# def show_league_standings_by_league(league_id)
#   response =  parse_api_request("https://api-football-v1.p.mashape.com/standings/#{league_id}")
#   table = response["standings"]
#   table.each do |rank, team_data|
#     puts "#{rank}. #{team_data["teamName"]} | #{team_data["play"]} | #{team_data["win"]} | #{team_data["draw"]} | #{team_data["lose"]} | #{team_data["points"]}   "
#   end
# end
#
# #show fixtures for a given team and year, some years although valid by API have no matches
# def show_team_fixtures_by_year(team_id, year="2019")
#   return "Year not valid, must be one of: #{get_availble_seasons}" if !get_availble_seasons.include?(year)
#   response = parse_api_request("https://api-football-v1.p.mashape.com/fixtures/team/#{team_id}")
#   fixtures = response["fixtures"]
#   matches = 0
#   fixtures.each do |id, fixture|
#     if fixture["event_date"].include?(year)
#       puts "#{fixture["event_date"][0..9]} #{fixture["homeTeam"]} vs #{fixture["awayTeam"]} "
#       matches += 1
#     end
#   end
#   "#{matches} found"
# end
#
#
#
# #Show all players by team id
# def show_players_by_team(team_id)
#   response =  parse_api_request("https://api-football-v1.p.mashape.com/players/2018/#{team_id}")
#   players = response["players"]
#   players.each  {|player| puts player["player"]}
# end
#
# #show a teams statistics for a given team / league
# def show_team_stats_by_team_and_league(league_id, team_id)
#   response = parse_api_request("https://api-football-v1.p.mashape.com/statistics/#{league_id}/#{team_id}")
#   matches = response["stats"]["matchs"]
#   puts "League Wins: Home:#{matches["wins"]["home"]} Away:#{matches["wins"]["away"]} "
#   puts "League Losses: Home:#{matches["loses"]["home"]} Away:#{matches["loses"]["away"]} "
#   puts "League Draws: Home:#{matches["draws"]["home"]} Away:#{matches["draws"]["away"]} "
# end
#
# #todo
# def get_teams_by_league_id(league_id)
#
# end

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
