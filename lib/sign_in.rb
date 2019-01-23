################## SIGN IN METHODS ##################
#==  Methods used during sign in / login flow     ==#
def sign_in_flow
  name = get_name
  if User.existing_user?(name)
    puts "Welcome Back #{name}"
    pass = get_pass
    check_credentials(name, pass)
  else
    puts "User not found, creating new user with name #{name}"
    pass = set_pass
    $user = User.create(name: name, password: pass)
  end
  app_start
end

#Starts the app
#  If the user has no teams or leagues set up provide the welcome flow
def app_start
  if $user.teams == [] && $user.leagues == []
    puts "Looks like you don't have any teams or leagues set up, time to get to it!"
    subscribe_flow
  else
    welcome_text
    main_menu
  end
end

#helper methods to prompt and retrive user input
def get_name
  puts "Please enter your name below"
  name = gets.strip
end

def get_pass
  puts "Please enter your password below"
  pass = gets.strip
end

def set_pass
  puts "what would you like your password to be?"
  pass = gets.strip
end


#Checks if a user with the given password and name exisits
#  if they do set the current user to that user object
#  if the do not exit the application
def check_credentials(name, pass)
  match = User.find_by(name: name, password: pass)
  if User.find_by(name: name, password: pass)
    $user = match
    return "Welcome back #{name}"
  else
    puts "Wrong password entered bye"
    exit
  end
end
