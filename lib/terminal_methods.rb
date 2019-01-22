################## ONBOARDING METHODS ##################
#== Methods used during onboarding flow for new user ==#
def sign_in_flow
  name = get_name
  if existing_user?(name)
    puts "we found your user #{name}"
    pass = get_pass


  else
    puts "user not found, creating new user with name #{name}"
    pass = set_pass
    $user = User.create(name: name, password: pass)
  end
end


def get_name
  puts "Please enter your name below (lowercase)"
  name = gets.strip.downcase
end

def get_pass
  puts "Please enter your password below"
  pass = gets.stip
end

def set_pass
  puts "what would you like your password to be?"
  pass = gets.strip
end

def existing_user?(name)
  User.find_by(name: name)
end

def check_credentials(name, pass)
  if User.find_by(name: name, password: pass)
    return "Welcome #{name}"
  else
    return ""
  end
end
