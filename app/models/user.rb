class User < ActiveRecord::Base
  has_many :user_leagues
  has_many :user_teams
  has_many :leagues, through: :user_leagues
  has_many :teams, through: :user_teams

  # USER METHODS
  def find_users_that_support_my_teams
    array = self.teams.collect{|team| team.id}
    all_users = array.map {|team_id| Team.find(team_id).users}.flatten
    all_users.map{|user| user.name}.uniq.drop(1)
  end


  def find_users_that_support_my_leagues
    array = self.leagues.collect{|league| league.id}
    all_users = array.map {|league_id| League.find(league_id).users}.flatten
    all_users.map{|user| user.name}.uniq.drop(1)
  end

  def suggest_teams
    all_users = self.teams.map {|team| team.users}.flatten.flatten.uniq.drop(1)
    all_users_array = all_users.collect{|user| user.teams}.flatten.uniq
    all_users_array.map {|team| get_team_name_by_id(team.api_team_id)}
  end


  def suggest_leagues
    all_users = self.leagues.map {|league| league.users}.flatten.uniq.drop(1)
    all_users_array = all_users.collect{|user| user.leagues}.flatten.uniq
    all_api_ids = all_users_array.map {|team| get_league_name_by_id(team.api_league_id)}
  end

  #Class Methods
  def self.existing_user?(name)
    User.find_by(name: name)
  end

  #class end
end
