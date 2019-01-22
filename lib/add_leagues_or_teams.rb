###### Contains all methods and text to add more leagues / teams to a users list of subscriptions

#method to control the flow of users when they subscribe to new leagues / teams§
def subscribe_flow
  prompt = TTY::Prompt.new
  league_lookup_hash = all_leagues_hash

  #Step 1 - add leagues the user follows
  search_league_text
  user_leagues = prompt.multi_select("Choose leagues to follow...", league_lookup_hash.values, filter: true)
  #map the readable league names to the league_ids
  user_league_ids = user_leagues.map {|league_name| league_lookup_hash.key(league_name) }

  #Step 2 - add teams the supports
  search_team_text
  personalized_leagues_hash = all_teams_hash_by_leagues(user_league_ids)
  user_teams = prompt.multi_select("Choose teams to support...", personalized_leagues_hash.values, filter: true)
  #map the team names to the team_ids
  user_team_ids = user_teams.map {|team_name| personalized_leagues_hash.key(team_name)}


  #this method needs to be implemented correctly, only pushes to stout not db
  write_new_teams_and_leagues(user_league_ids, user_team_ids)
end

#Prompts user to search for leaues they want to follow
def search_league_text
  puts "\n\n   What leagues do you follow?  "
  puts "--------------------------------------------\n\n"
  puts "Football is the world's most popular game, which leagues do you follow?"
  puts Rainbow("Search for your league using the keyboard and select using space").red
  puts Rainbow("You can search by country or league name!!").red
  puts ""
  puts Rainbow("Confirm with enter when you are done!").green
end

#Prompts user to search for leaues they want to follow
def search_team_text
  puts "\n\n  What teams do you support?  "
  puts "--------------------------------------------\n\n"
  puts "Add all the teams you support below, we have limited the selection to the"
  puts "leagues that you are following!"
  puts ""
  puts Rainbow("Search for your team(s) using the keyboard and select using space").red
  puts Rainbow("You can search by team name!!").red
  puts ""
  puts Rainbow("Confirm with enter when you are done!").green
end

#TODO --- Write to DB
def write_new_teams_and_leagues(league_ids, team_ids)
  league_ids.each {|id| puts id}
  team_ids.each {|id| puts id}
end
