################### SIGN IN ####################
#==  Class used during sign in / login flow     ==#

class SignIn
  #Controls the flow of the sign in process
  def self.sign_in_flow
    puts Copy.welcome
    Copy.wait_short
    puts Copy.get_name
    name = self.get_stripped_input
    if User.existing_user?(name)
      puts Copy.user_found(name)
      puts Copy.get_pass
      pass = self.get_stripped_input
      check_credentials(name, pass)
    else
      puts Copy.user_not_found
      Menu.create_user_menu
    end
    self.app_start
  end

  #Creates a new user
  def self.create_new_user
    puts Copy.get_name
    name = get_stripped_input
    puts Copy.set_pass
    pass = get_stripped_input
    $user = User.create(name: name, password: pass)
  end

  #Starts the app
  #  If the user has no teams or leagues set up provide the welcome flow
  def self.app_start
    if $user.teams == [] && $user.leagues == []
      system "clear"
      puts Copy.no_teams_or_leagues
      subscribe_flow
    else
      puts Copy.welcome
      Menu.main_menu
    end
  end

  #strips input
  def self.get_stripped_input
    input = gets.strip
  end

  #Checks if a user with the given password and name exisits
  #  if they do set the current user to that user object
  #  if the do not exit the application
  def self.check_credentials(name, pass)
    match = User.find_by(name: name, password: pass)
    if User.find_by(name: name, password: pass)
      $user = match
      puts Copy.user_found(name)
    else
      puts Copy.bad_password
      sign_in_flow
    end
  end
end
