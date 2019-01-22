################## ONBOARDING METHODS ##################
#== Methods used during onboarding flow for new user ==#

#Takes a country and returns an array of strings containing all
#  leagues that are availble for that country add the league ID on the end
def show_league_by_country(chosen_country)
  country_leagues = get_leagues_by_country_name_and_season(chosen_country).values
  country_leagues.map {|league| "#{league["name"]} ##{league["league_id"]}"}
end

def show_teams_by_league(chosen_league)
  league_teams = get_teams_by_league(chosen_league).values
  league_teams.map {|team| "#{team["name"]} ##{team["team_id"]}"}
end
