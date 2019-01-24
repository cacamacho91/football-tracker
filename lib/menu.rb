### Class to support all menus and routing in the system ###
class Menu
  #Create user menu
  def self.create_user_menu
    prompt = TTY::Prompt.new
    options = [Copy.create_user_yes, Copy.create_user_no]
    self.create_user_router(prompt.select(Copy.create_user_prompt, options))
  end

  #Main Menu with top level options
  def self.main_menu
    prompt = TTY::Prompt.new
    options = [Copy.menu_myteams, Copy.menu_myleagues, Copy.menu_mystats, Copy.menu_quit]
    self.main_menu_router(prompt.select(Copy.option_prompt, options))
  end

  # The my teams menu
  def self.my_teams_menu
    prompt = TTY::Prompt.new
    options = [Copy.menu_back, Copy.team_menu_fixture_year, Copy.team_menu_current_players]
    self.my_teams_router(prompt.select(Copy.option_prompt, options))
  end

  # The my leagues menu
  def self.my_leagues_menu
    prompt = TTY::Prompt.new
    options = [Copy.menu_back, Copy.league_menu_tables]
    self.my_leagues_router(prompt.select(Copy.option_prompt, options))
  end

  # The stats menu
  def self.stats_menu
    prompt = TTY::Prompt.new
    options = [Copy.menu_back,
      Copy.stats_menu_same_users_team,
      Copy.stats_menu_same_users_league,
      Copy.stats_menu_most_teams,
      Copy.stats_menu_most_leagues,
      Copy.stats_menu_most_support,
      Copy.stats_menu_least_support,
      Copy.stats_menu_most_follows,
      Copy.stats_menu_least_follows,
      Copy.stats_menu_suggest_teams,
      Copy.stats_menu_same_users,
      Copy.stats_menu_tfteams,
      Copy.stats_menu_tfleagues,
      Copy.stats_menu_ttfollowers,
      Copy.stats_menu_ttsupporters]
    self.my_stats_router(prompt.select(Copy.option_prompt, options))
  end

  #####  ROUTING  ####
  ## The routing for every menu is controlled below

  #The routing for create user menus
  def self.create_user_router(option_selected)
    case option_selected
    when Copy.create_user_yes
        SignIn.create_new_user
      when Copy.create_user_no
        puts Copy.goodbye
        exit
      else
        puts Copy.unknown_input
        self.create_user_menu
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
      when Copy.menu_quit
        puts Copy.goodbye
        exit
      else
        puts Copy.unknown_input
        self.main_menu
    end
  end

  # The routing for my teams
  def self.my_teams_router(option_selected)
    case option_selected
      when Copy.menu_back
        self.main_menu
      when Copy.team_menu_fixture_year
        $user.teams.each{ |team| puts Copy.future_fixtures(this_years_fixtures(get_team_fixtures(team.api_team_id))) }
        self.my_teams_menu
      when Copy.team_menu_current_players
        $user.teams.each do |team|
          Copy.team_players(get_players_by_team(team.api_team_id)).each {|player| puts player}
        end
        self.my_teams_menu
      else
        puts Copy.unknown_input
        self.my_teams_menu
    end
  end

  # The routing for my leagues
  def self.my_leagues_router(option_selected)
    case option_selected
      when Copy.menu_back
        self.main_menu
      when Copy.league_menu_tables
        $user.leagues.each{ |league| puts Copy.league_standings(get_league_standings_by_league(league.api_league_id)) }
        self.main_menu
      else
        puts Copy.unknown_input
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
        self.stats_menu
      when Copy.stats_menu_same_users_league
        puts $user.find_users_that_support_my_leagues
        self.stats_menu
      when Copy.stats_menu_most_teams
        puts user_who_supports_most_teams
        self.stats_menu
      when Copy.stats_menu_most_leagues
        puts user_who_supports_most_leagues
        self.stats_menu
      when Copy.stats_menu_most_support
        puts team_with_most_followers
        self.stats_menu
      when Copy.stats_menu_least_support
        puts team_with_least_followers
        self.stats_menu
      when Copy.stats_menu_most_follows
        puts league_with_most_followers
        self.stats_menu
      when Copy.stats_menu_least_follows
        puts league_with_least_followers
        self.stats_menu
      when Copy.stats_menu_suggest_teams
        puts $user.suggest_teams
        self.stats_menu
      when Copy.stats_menu_same_users
        puts $user.suggest_leagues
        self.stats_menu
      when Copy.stats_menu_tfteams
        top_5_teams.each {|team| puts team}
        self.stats_menu
      when Copy.stats_menu_tfleagues
        top_5_leagues.each {|league| puts league}
        self.stats_menu
      when Copy.stats_menu_ttfollowers
        puts Copy.top_10_leaderboard(top_10_followers, "Top Followers", "# Leagues Followed")
        self.stats_menu
      when Copy.stats_menu_ttsupporters
        puts puts Copy.top_10_leaderboard(top_10_fans, "Top Fans", "# Clubs Supported")
        self.stats_menu
      else
        puts Copy.unknown_input
        self.stats_menu
    end
  end
end
