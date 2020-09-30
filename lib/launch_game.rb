require 'readline'

def launch_game
  puts "[N.B. You can exit at any time by typing 'exit']\nHello stranger, are you ready for an adventure? (yes/no)\n"

  while input = Readline.readline("> ", true)
    break if input == 'exit'
  end

  puts 'See you soon, bye!'
end
