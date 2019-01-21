def welcome
  puts "WELCOME TO THE SPURS / PREMIER LEAGUE FOOTBALL TRACKER!"
  puts "-------------------------------------------------------"
end

def show_menu
  puts "Your options are:"
  puts "1. View the current premier league table"
  puts "2. Show spurs 2019 fixtures"
  puts "3. Show the current premier league teams"
  puts "4. Show Spurs players for this season"
  puts "5. Show me Spurs statistics for this season"
  option = option_selector(5)
  run_option(option)
end

def run_option(option_number)
  case option_number
  when 1
    show_prem_league_table
  when 2
    show_spurs_fixtures_2019
  when 3
    show_all_prem_teams
  when 4
    show_spurs_players
  when 5
    show_spurs_today_stats
  else
    "ERROR -- Number not found"
  end
end

def option_selector(num_options)
  loop do
    puts "Please select from the #{num_options} provided: "
    response = gets.strip.to_i
    return response if response >= 1 && response <= num_options
    puts "Option not valid, please select an option within the range of 0->#{num_options}: "
  end
end
