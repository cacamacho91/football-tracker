
# THESE ARE ALL THE STATISTICS METHODS
def user_who_supports_most_teams
  array = UserTeam.all.collect{|user| user.user_id}
  most_common_value = array.uniq.max_by{ |i| array.count( i ) }
  user = User.find(most_common_value)
user.name
end

def user_who_supports_most_leagues
  array = UserLeague.all.collect{|user| user.user_id}
  most_common_value = array.uniq.max_by{ |i| array.count( i ) }
  user = User.find(most_common_value)
user.name
end

def team_with_most_followers
  array = UserTeam.all.collect{|user| user.team_id}
    most_common_value = array.uniq.max_by{ |i| array.count( i ) }
    team = Team.find(most_common_value)
team.api_team_id
end

def team_with_least_followers
  array = UserTeam.all.collect{|user| user.team_id}
  most_common_value = array.uniq.min_by{ |i| array.count( i ) }
  team = Team.find(most_common_value)
team.api_team_id
end

def league_with_most_followers
  array = UserLeague.all.collect{|user| user.league_id}
  most_common_value = array.uniq.max_by{ |i| array.count( i ) }
  league = League.find(most_common_value)
league.api_league_id
end

def league_with_least_followers
  array = UserLeague.all.collect{|user| user.league_id}
  most_common_value = array.uniq.min_by{ |i| array.count( i ) }
  league = League.find(most_common_value)
league.api_league_id
end
