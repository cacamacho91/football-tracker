### Controls all menus in the system ###

#####  MENUS  ####
## The menus are created here

#Main Menu with top level options
def main_menu
  prompt = TTY::Prompt.new
  options = [
    "⚽ My Teams",
    "🥇 My Leagues",
    "📊 Statistics",
    "❌ Quit",
  ]
  main_menu_router(prompt.select("Pick an option \n\n", options))
end

##TODO - replace with proper calls to get the users teams
# The my teams menu
def my_teams_menu
  prompt = TTY::Prompt.new
  options = ["👈 Go Back",
    "Show fixtures for my teams this year",
    "Show all current players for my teams"]
  my_teams_router(prompt.select("Pick an option \n\n", options))
end

##TODO - replace with proper calls to get the users leagues
# The my leagues menu
def my_leagues_menu
  prompt = TTY::Prompt.new
  options = [
    "👈 Go Back",
    "Show current table(s) for all my leagues"]
  my_leagues_router(prompt.select("Pick an option \n\n", options))
end

# The stats menu
def stats_menu
  prompt = TTY::Prompt.new
  options = [
    "👈 Go Back",
    "Show all users who support at least 1 team the same as me",
    "Show all users who follow at least 1 league the same as me",
    "Show the user that supports the most teams",
    "Show the user that supports the most leagues",
    "Show the team with the most supporters",
    "Show the team with the least supporters",
    "Show the league with the most followers",
    "Show the league with the least followers",
    "Suggest teams I may like",
    "Suggest leagues I may like",
  ]
  my_stats_router(prompt.select("Pick an option \n\n", options))
end

#####  ROUTING  ####
## The routing for every menu is controlled here

# The routing for the main menu
def main_menu_router(option_selected)
  case option_selected
    when "⚽ My Teams"
      my_teams_menu
    when "🥇 My Leagues"
      my_leagues_menu
    when "📊 Statistics"
      stats_menu
    when "❌ Quit"
      puts "Thanks for stopping by!"
      exit
    else
      puts "UNKNOWN INPUT!!!!"
  end
end

# The routing for my teams
def my_teams_router(option_selected)
  case option_selected
    when "👈 Go Back"
      main_menu
    when "Show fixtures for my teams this year"
      $user.teams.each{ |team| show_team_fixtures_by_year(team.api_team_id) }
      my_teams_menu
    when "Show all current players for my teams"
      $user.teams.each{ |team| show_players_by_team(team.api_team_id) }
      my_teams_menu
    else
      puts "UNKNOWN INPUT!!!!"
      my_teams_menu
  end
end

# The routing for my leagues
def my_leagues_router(option_selected)
  case option_selected
    when "👈 Go Back"
      main_menu
    when "Show current table(s) for all my leagues"
      $user.leagues.each{ |league| show_league_standings_by_league(league.api_league_id) }
      main_menu
    else
      puts "UNKNOWN INPUT!!!!"
      my_leagues_menu
  end
end

# The routing for my stats (yikes refactor this later)
def my_stats_router(option_selected)
  case option_selected
    when "👈 Go Back"
      main_menu
    when "Show all users who support at least 1 team the same as me"
      puts $user.find_users_that_support_my_teams
      stats_menu
    when "Show all users who follow at least 1 league the same as me"
      puts $user.find_users_that_support_my_leagues
      stats_menu
    when "Show the user that supports the most teams"
      puts user_who_supports_most_teams
      stats_menu
    when "Show the user that supports the most leagues"
      puts user_who_supports_most_leagues
      stats_menu
    when "Show the team with the most supporters"
      puts team_with_most_followers
      stats_menu
    when "Show the team with the least supporters"
      puts team_with_least_followers
      stats_menu
    when "Show the league with the most followers"
      puts league_with_most_followers
      stats_menu
    when "Show the league with the least followers"
      puts league_with_least_followers
      stats_menu
    when "Suggest teams I may like"
      puts $user.suggest_teams
      stats_menu
    when "Suggest leagues I may like"
      puts $user.suggest_leagues
      stats_menu
    else
      puts "UNKNOWN INPUT!!!!"
  end
end
