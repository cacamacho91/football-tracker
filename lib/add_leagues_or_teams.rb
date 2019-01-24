###### Contains all methods and text to add more leagues / teams to a users list of subscriptions

#method to control the flow of users when they subscribe to new leagues / teams§
def subscribe_flow
  prompt = TTY::Prompt.new
  league_lookup_hash = all_leagues_hash

  user_leagues = []
  #Step 1 - add leagues the user follows and make sure it is at least 1
  while user_leagues == [] do
    Copy.print_header
    Copy.search_league_text
    user_leagues = prompt.multi_select("Choose leagues to follow...", league_lookup_hash.values,per_page: 25, filter: true)
  end
  user_league_ids = user_leagues.map {|league_name| league_lookup_hash.key(league_name) }
  personalized_leagues_hash = all_teams_hash_by_leagues(user_league_ids)

  user_teams = []
  #Step 2 - add teams the supports
  while user_teams == [] do
    Copy.print_header
    Copy.search_team_text
    user_teams = prompt.multi_select("Choose teams to support...", personalized_leagues_hash.values,per_page: 25, filter: true)
  end
  user_team_ids = user_teams.map {|team_name| personalized_leagues_hash.key(team_name)}

  #this method needs to be implemented correctly, only pushes to stout not db
  write_new_teams_and_leagues(user_league_ids, user_team_ids)
end


#Write the users selected teams and leagues to the database
def write_new_teams_and_leagues(league_ids, team_ids)
  league_ids.each { |league_id| $user.leagues << League.find_or_create_by(api_league_id: league_id) }
  team_ids.each { |team_id| $user.teams << Team.find_or_create_by(api_team_id: team_id) }
end
