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
  options = [
    "👈 Go Back",
    "Tottenham (HARDCODED TEST DATA)",
    "Manchester United (HARDCODED TEST DATA)",
    "Real Madrid (HARDCODED TEST DATA)",
  ]
  my_teams_router(prompt.select("Pick an option \n\n", options))
end

##TODO - replace with proper calls to get the users leagues
# The my leagues menu
def my_leagues_menu
  prompt = TTY::Prompt.new
  options = [
    "👈 Go Back",
    "PREMIER LEAGUE (HARDCODED TEST DATA)",
    "LA LIGA (HARDCODED TEST DATA)",
    "WORLD CUP (HARDCODED TEST DATA)",
  ]
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
    else
      puts "They want to see a team specific menu for #{option_selected}"
      my_teams_menu
  end
end

# The routing for my leagues
def my_leagues_router(option_selected)
  case option_selected
    when "👈 Go Back"
      main_menu
    else
      puts "They want to see a league specific menu for #{option_selected}"
      my_leagues_menu
  end
end

# The routing for my stats (yikes refactor this later)
def my_stats_router(option_selected)
  case option_selected
    when "👈 Go Back"
      main_menu
    when "Show all users who support at least 1 team the same as me"
      puts "Run PARIK METHOD"
      stats_menu
    when "Show all users who follow at least 1 league the same as me"
      puts "Run PARIK METHOD"
      stats_menu
    when "Show the user that supports the most teams"
      puts "Run PARIK METHOD"
      stats_menu
    when "Show the user that supports the most leagues"
      puts "Run PARIK METHOD"
      stats_menu
    when "Show the team with the most supporters"
      puts "Run PARIK METHOD"
      stats_menu
    when "Show the team with the least supporters"
      puts "Run PARIK METHOD"
      stats_menu
    when "Show the league with the most followers"
      puts "Run PARIK METHOD"
      stats_menu
    when "Show the league with the least followers"
      puts "Run PARIK METHOD"
      stats_menu
    when "Suggest teams I may like"
      puts "Run PARIK METHOD"
      stats_menu
    when "Suggest leagues I may like"
      puts "Run PARIK METHOD"
      stats_menu
    else
      puts "UNKNOWN INPUT!!!!"
  end
end
