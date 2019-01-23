#Class which returns all copy used in the app for consistancy, clenliness
#  and convinience
class Copy
  #Sign in flow copy
  def self.welcome
    "Welcome to the Football - Tracker CLI APP!\n\n"
  end
  def self.goodbye
    "Thanks for stopping by!"
  end
  def self.user_found(name)
    "Welcome back #{name}"
  end
  def self.user_not_found
    "User not found!"
  end
  def self.create_user_prompt
    "Would you like to create a new user?"
  end
  def self.get_name
    "What is your name?"
  end
  def self.get_pass
    "What is your password?"
  end
  def self.set_pass
    "Choose a password"
  end
  def self.create_user_yes
    "Yes - I love the beautiful game"
  end
  def self.create_user_no
    "No - I am a heathen"
  end
  def self.unknown_input
    "I don't understand what you just picked, this is akward..."
  end
  def self.no_teams_or_leagues
    "Looks like you don't have any teams or leagues set up, time to get to it!"
  end
  def self.bad_password
    "Password incorrect, Try Again!"
  end
  def self.menu_myteams
    "⚽ My Teams"
  end
  def self.menu_myleagues
    "🥇 My Leagues"
  end
  def self.menu_mystats
    "📊 Statistics"
  end
  def self.menu_quit
    "❌ Quit"
  end
  def self.option_prompt
    "Please pick an option from below"
  end
  def self.menu_back
    "👈 Go Back"
  end
  def self.team_menu_fixture_year
    "Show fixtures for my teams this year"
  end
  def self.team_menu_current_players
    "Show all current players for my teams"
  end
  def self.league_menu_tables
    "Show current table(s) for all my leagues"
  end
  def self.stats_menu_same_users_team
    "Show all users who support at least 1 team the same as me"
  end
  def self.stats_menu_same_users_league
    "Show all users who follow at least 1 league the same as me"
  end
  def self.stats_menu_most_teams
    "Show the user that supports the most teams"
  end
  def self.stats_menu_most_leagues
    "Show the user that supports the most leagues"
  end
  def self.stats_menu_most_support
    "Show the team with the most supporters"
  end
  def self.stats_menu_least_support
    "Show the team with the most supporters"
  end
  def self.stats_menu_most_follows
    "Show the league with the most followers"
  end
  def self.stats_menu_least_follows
    "Show the league with the least followers"
  end
  def self.stats_menu_suggest_teams
    "Suggest teams I may like"
  end
  def self.stats_menu_same_users
    "Suggest leagues I may like"
  end
end