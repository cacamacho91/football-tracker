def animation
  i = 1
  while i < 81
    print "\033[2J"
    File.foreach("#{Dir.pwd}/lib/support/animation/#{i}.rb") { |f| puts f }
    sleep(0.04)
    i += 1
  end
end
