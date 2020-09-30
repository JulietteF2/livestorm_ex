require 'readline'
require_relative 'directions/first_step'
require_relative 'directions/pick_room'
require_relative 'directions/back_to_main'

# Keep track of where the player is
KEEP_TRACK = []
# Store what the player collects along the game
ARTEFACTS = []
FOOD = []
# When invalid input is received
INVALID = 'Sorry, your answer is not valid, please try again'

def launch_game
  puts "[N.B. You can exit at any time by typing 'exit']\nHello stranger, are you ready for an adventure? (yes/no)\n"

  while input = Readline.readline("> ", true)
    break if input == 'exit'

    case KEEP_TRACK.last
    when nil
      first_step(input) ? '' : break
    when 'hall'
      pick_room(input)
    when 'livingroom'
      living_room(input)
    end
  end

  puts 'See you soon, bye!'
end
