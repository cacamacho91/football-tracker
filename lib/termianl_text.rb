############### GENERIC TEXT ###############
#== Text used repeatedly by application ==#

#Welcome message to all users on CLI run
def welcome_text
  puts "\n\n ⚽ WELCOME TO THE CLI FOOTBALL TRACKER ⚽ "
  puts "------------------------------------------\n\n"
  puts "Check out fixtures, scores, standings and"
  puts "more from ~300 leagues accross over 41 countries!"
end

################## ONBOARDING TEXT ##################
#== Text used during onboarding flow for new user ==#

#Step 1) Prompt user to pick a country they are interested in
def pick_country_text
  puts "\n\n   STEP 1 - PICK YOUR COUNTRY   "
  puts "--------------------------------------------\n\n"
  puts "Football is the world's most popular game, which country do you follow?"
  puts "If you follow more than 1 you can add more later, fear not!"
end

#Step 2) Ask user to a league they are interested in
def pick_league_text
  puts "\n\n    STEP 2 - PICK YOUR LEAGUE"
  puts "--------------------------------------------\n\n"
  puts "Which league do you follow from that country?"
  puts "If you follow more than 1 you can add more later, fear not!"
end

#Step 3) Ask user to pick teams they are interested in
def pick_teams_text
  puts "\n\n    STEP 3 - PICK YOUR TEAM!"
  puts "------------------------------------------"
  puts "Select a team to support from the league that you follow"
  puts "If you follow more than 1 you can add more later, fear not!"
end
