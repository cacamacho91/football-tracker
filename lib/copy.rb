#Class which returns all copy used in the app for consistancy, clenliness
#  and convinience
class Copy
  #Prompts user to search for leaues they want to follow
  def self.search_league_text
    puts "\n   Which leagues do you follow?  "
    puts Rainbow("You MUST select at least 1 league!").red
    puts "--------------------------------------------\n"
    puts "Find your favorite league or search by their names"
    puts Rainbow("You can search by country or league name!!").red
    puts ""
    puts Rainbow("Confirm with enter when you are done!").green
  end

  #Prompts user to search for leaues they want to follow
  def self.search_team_text
    puts "\n  What teams do you support?  "
    puts Rainbow("You MUST select at least 1 team!").red
    puts "--------------------------------------------\n"
    puts "Add all the teams you support below, we have limited the selection to the"
    puts "leagues that you are following!"
    puts ""
    puts "Find your favorite team or search by their names"
    puts Rainbow("You can search by team name!!").red
    puts ""
    puts Rainbow("Confirm with enter when you are done!").green
  end
  # Pause for shorter
  def self.wait_short
    sleep(2)
  end
  # Pause for longer
  def self.wait_long
    sleep(4)
  end
  def self.print_header
    system "clear"
    puts self.header
    puts self.sub_header
  end
  def self.header
    system "clear"
    header = Artii::Base.new :font => 'slant'
    header.asciify('Global Football Tracker!')
  end
  def self.sub_header
    puts"-------------------------------------------------------------------------------------------------------------------------"
    puts"Keep track of all events in the beautiful game, with live data from 1000's of clubs, over 300+ leagues across 40+ nations!"
    puts"Made with 💙 by Chris and Parik"
    puts"-------------------------------------------------------------------------------------------------------------------------"
  end
  def self.goodbye
    bye = Artii::Base.new :font => 'slant'
    bye.asciify('Thanks for stopping by!')
  end
  def self.user_not_found
    Rainbow("⛔ Error: User not found, check your spelling & case").red
  end
  def self.user_existing_error
    Rainbow("⛔ Error: User name in use, try a different name").red
  end
  def self.get_name
    "What's Your Name?:"
  end
  def self.get_pass
    "What is your password?"
  end
  def self.set_pass
    "Choose a password"
  end
  def self.unknown_input
    "I don't understand what you just picked, this is awkward..."
  end
  def self.no_teams_or_leagues
    "Let's Add Your Favorite Teams and Leagues!"
  end
  def self.bad_password
    Rainbow("⛔ Error: Password incorrect").red
  end
  def self.menu_login
    "🔑 Login"
  end
  def self.menu_signup
    "📝 Sign-Up"
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
  def self.menu_showlive
    "🕒 Show LIVE fixtures & scores"
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
  def self.stats_menu_suggest_teams
    "Suggest teams I may like"
  end
  def self.stats_menu_same_users
    "Suggest leagues I may like"
  end
  def self.stats_menu_tfteams
    "Show 5 most supported teams"
  end
  def self.stats_menu_tfleagues
    "Show 5 most supported leagues"
  end
  def self.stats_menu_ttfollowers
    "Who follows the most leagues?"
  end
  def self.stats_menu_ttsupporters
    "Who follows the most teams?"
  end

  #takes a league hash and returns a beautiful league table
  def self.league_standings(league_hash)
    rows = []
    league_hash.each do |rank, team_data|
      rows << [rank, team_data["teamName"], team_data["play"], team_data["win"], team_data["draw"], team_data["lose"],
               team_data["goalsFor"], team_data["goalsAgainst"], team_data["goalsDiff"], team_data["points"]]
    end
    return "No Leagues Found" if rows == []
    Terminal::Table.new :title => "League Standings", :headings => ["#", "Team", "P", "W", "D", "L", "Gs", "Ga", "G+/-", "Pts"], :rows => rows
  end

  #takes a set of fixtures in the future and returns a beautiful table to display
  def self.future_fixtures(fixture_hash)
     rows = []
     fixture_hash.each do |id, fixture_data|
       rows << [fixture_data["event_date"][0..9], fixture_data["round"], fixture_data["homeTeam"], fixture_data["awayTeam"]]
     end
     return "No Fixtures Found" if rows == []
     Terminal::Table.new :title => "Fixtures", :headings => ["Date", "Competition / Round", "Home Team", "AwayTeam"], :rows => rows
  end

  def self.team_players(players)
    players.map{ |player| player["player"] }
  end

  #Takes a hash of fixtures in the past and returns a beautiful table to display with a Live Score
  def self.started_fixtures(fixture_hash)
    rows = []
    fixture_hash.each do |id, fixture_data|
      rows << [fixture_data["event_timestamp"][0..3].insert(2, ":"), fixture_data["homeTeam"],
      fixture_data["awayTeam"], "#{fixture_data["goalsHomeTeam"]} - #{fixture_data["goalsAwayTeam"]}"]
    end
    return "No Fixtures Found" if rows == []
    Terminal::Table.new :title => "Live Matches", :headings => ["Time (Local)", "Home", "Away", "Live Score"], :rows => rows
  end

  #Takes a to 10 hash and displays in a Leaderboard
  def self.top_10_leaderboard(top_10_hash, name="Leaderboard", value="#")
    rows = []
    top_10_hash.each { |name, score| rows << [name, score] }
    return "No Data Found" if rows == []
    Terminal::Table.new :title => name, :headings => ["User", value], :rows => rows
  end

end
