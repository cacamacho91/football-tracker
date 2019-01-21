def welcome
  puts "WELCOME TO THE SPURS / PREMIER LEAGUE FOOTBALL TRACKER!"
  puts "-------------------------------------------------------"
end

def show_menu
  puts "Your options are:"
  puts "1. View the current premier league table"
  puts "2. Show todays premier league fixtures"
  puts "3. Show the current premier league teams"
  puts "4. Show Spurs players for this season"
  puts "5. Show Spurs player lineup for the last fixture"
  puts "6. Show me Spurs statistics for this season"
  option_selector(6)
end

def option_selector(num_options)
  loop do
    puts "Please select from the #{num_options} provided: "
    response = gets.strip.to_i
    return "You selected option #{response}" if response > 0 && response < num_options
    puts "Option not valid, please select an option within the range of 0->#{num_options}: "
  end
end
