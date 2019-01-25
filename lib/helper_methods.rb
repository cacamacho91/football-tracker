#### ALL Methods to help support other areas of the app

#Takes a hash of fixtures and returns all of those that are this year
def this_years_fixtures(fixture_hash)
  current_year = Time.new.year.to_s
  fixture_hash.select {|id, fixture_data| fixture_data["event_date"][0..3] == current_year}
end

#Returns a hash of the users who support the most teams
def top_10_fans
  users_array = UserTeam.all.collect{|user| user.user_id}
  most_common_value = users_array.uniq.sort_by{ |i| users_array.count( i ) }.reverse
  biggest_fans = most_common_value.map {|user| User.find(user).name}[0..9]
  users_teams_count = most_common_value.map {|user|  User.find(user).teams.count}[0..9]
  counter = 0
  return_hash = {}
  until counter == biggest_fans.length do
    return_hash[biggest_fans[counter].to_s] = users_teams_count[counter].to_s
    counter += 1
  end
  return_hash
end

#Returns a hash of the users who follow the most leagues
def top_10_followers
  users_array = UserLeague.all.collect{|user| user.user_id}
  most_common_value = users_array.uniq.sort_by{ |i| users_array.count( i ) }.reverse
  biggest_followers = most_common_value.map {|user|  User.find(user).name}[0..9]
  users_league_count = most_common_value.map {|user|  User.find(user).leagues.count}[0..9]
  counter = 0
  return_hash = {}
  until counter == biggest_followers.length do
    return_hash[biggest_followers[counter].to_s] = users_league_count[counter].to_s
    counter += 1
  end
  return_hash
end

#returns an array of the names of the top 5 most followed leagues
def top_5_leagues
  league_names = []
  leagues = UserLeague.all.collect{|league| league.league_id}
  most_common_value = leagues.uniq.sort_by{ |i| leagues.count( i ) }.reverse[0..4]
  most_common_value.each do |league|
    league_names << get_league_name_by_id(League.find(league).api_league_id)
  end
  league_names
end

#returns an array of the names of the top 5 most followed teams
def top_5_teams
  team_names = []
  teams = UserTeam.all.collect{|team| team.team_id}
  most_common_value = teams.uniq.sort_by{ |i| teams.count( i ) }.reverse[0..4]
  most_common_value.each do |team|
    team_names << get_team_name_by_id(Team.find(team).api_team_id)
  end
  team_names
end
