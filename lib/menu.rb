### Class to support all menus and routing in the system ###
class Menu
  #Login Menu
  def self.login_menu
    prompt = TTY::Prompt.new
    options = [Copy.menu_login, Copy.menu_signup, Copy.menu_forgotpass, Copy.menu_quit]
    self.login_router(prompt.select(Copy.option_prompt, options))
  end

  #Continue Menu
  def self.continue_menu
    prompt = TTY::Prompt.new
    puts ""
    prompt.keypress("Press SPACE or ENTER to continue / see next >>", keys: [:space, :return])
  end

  #Main Menu with top level options
  def self.main_menu
    system "clear"
    puts Copy.header
    puts Copy.sub_header
    prompt = TTY::Prompt.new
    options = [Copy.menu_myteams, Copy.menu_myleagues, Copy.menu_mystats, Copy.menu_showlive, Copy.menu_quit]
    self.main_menu_router(prompt.select(Copy.option_prompt, options, per_page: 25))
  end

  # The my teams menu
  def self.my_teams_menu
    system "clear"
    puts Copy.header
    puts Copy.sub_header
    prompt = TTY::Prompt.new
    options = [Copy.menu_back, Copy.team_menu_fixture_year, Copy.team_menu_current_players]
    self.my_teams_router(prompt.select(Copy.option_prompt, options, per_page: 25))
  end

  # The my leagues menu
  def self.my_leagues_menu
    system "clear"
    puts Copy.header
    puts Copy.sub_header
    prompt = TTY::Prompt.new
    options = [Copy.menu_back, Copy.league_menu_tables]
    self.my_leagues_router(prompt.select(Copy.option_prompt, options, per_page: 25))
  end

  # The stats menu
  def self.stats_menu
    system "clear"
    puts Copy.header
    puts Copy.sub_header
    prompt = TTY::Prompt.new
    options = [Copy.menu_back,
      Copy.stats_menu_same_users_team,
      Copy.stats_menu_same_users_league,
      Copy.stats_menu_suggest_teams,
      Copy.stats_menu_same_users,
      Copy.stats_menu_tfteams,
      Copy.stats_menu_tfleagues,
      Copy.stats_menu_ttfollowers,
      Copy.stats_menu_ttsupporters]
    self.my_stats_router(prompt.select(Copy.option_prompt, options, per_page: 25))
  end

  #####  ROUTING  ####
  ## The routing for every menu is controlled below

  #The initial routing on app load
  def self.login_router(option_selected)
    case option_selected
    when Copy.menu_login
      SignIn.sign_in_flow
    when Copy.menu_signup
      SignIn.create_new_user
    when Copy.menu_forgotpass
      SignIn.forgot_password
    when Copy.menu_quit
      system "clear"
      puts Copy.goodbye
      exit
    else
      puts Copy.unknown_input
      self.continue_menu
      self.login_menu
    end
  end


  # The routing for the main menu
  def self.main_menu_router(option_selected)
    case option_selected
    when Copy.menu_myteams
        self.my_teams_menu
      when Copy.menu_myleagues
        self.my_leagues_menu
      when Copy.menu_mystats
        self.stats_menu
      when Copy.menu_showlive
        puts Copy.started_fixtures(get_live_fixtures)
        self.continue_menu
        self.main_menu
      when Copy.menu_quit
        system "clear"
        puts Copy.goodbye
        exit
      else
        puts Copy.unknown_input
        self.continue_menu
        self.main_menu
    end
  end

  # The routing for my teams
  def self.my_teams_router(option_selected)
    case option_selected
      when Copy.menu_back
        self.main_menu
      when Copy.team_menu_fixture_year
        $user.teams.each do |team|
          puts Copy.future_fixtures(this_years_fixtures(get_team_fixtures(team.api_team_id)))
          continue_menu
          system "clear"
        end
        self.my_teams_menu
      when Copy.team_menu_current_players
        $user.teams.each do |team|
          Copy.team_players(get_players_by_team(team.api_team_id)).each {|player| puts player}
          continue_menu
          system "clear"
        end
        self.my_teams_menu
      else
        puts Copy.unknown_input
        self.continue_menu
        self.my_teams_menu
    end
  end

  # The routing for my leagues
  def self.my_leagues_router(option_selected)
    case option_selected
      when Copy.menu_back
        self.main_menu
      when Copy.league_menu_tables
        $user.leagues.each do
          |league| puts Copy.league_standings(get_league_standings_by_league(league.api_league_id))
          continue_menu
          system "clear"
        end
        self.main_menu
      else
        puts Copy.unknown_input
        self.continue_menu
        self.my_leagues_menu
    end
  end

  # The routing for my stats (yikes refactor this later)
  def self.my_stats_router(option_selected)
    case option_selected
      when Copy.menu_back
        self.main_menu
      when Copy.stats_menu_same_users_team
        puts $user.find_users_that_support_my_teams
        self.continue_menu
        self.stats_menu
      when Copy.stats_menu_same_users_league
        puts $user.find_users_that_support_my_leagues
        self.continue_menu
        self.stats_menu
      when Copy.stats_menu_suggest_teams
        puts $user.suggest_teams
        self.continue_menu
        self.stats_menu
      when Copy.stats_menu_same_users
        puts $user.suggest_leagues
        self.continue_menu
        self.stats_menu
      when Copy.stats_menu_tfteams
        top_5_teams.each {|team| puts team}
        self.continue_menu
        self.stats_menu
      when Copy.stats_menu_tfleagues
        top_5_leagues.each {|league| puts league}
        self.continue_menu
        self.stats_menu
      when Copy.stats_menu_ttfollowers
        puts Copy.top_10_leaderboard(top_10_followers, "Top Followers", "# Leagues Followed")
        self.continue_menu
        self.stats_menu
      when Copy.stats_menu_ttsupporters
        puts Copy.top_10_leaderboard(top_10_fans, "Top Fans", "# Clubs Supported")
        self.continue_menu
        self.stats_menu
      else
        puts Copy.unknown_input
        self.continue_menu
        self.stats_menu
    end
  end
end
