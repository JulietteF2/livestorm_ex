require 'readline'
require_relative 'directions/first_step'
require_relative 'directions/pick_room'
require_relative 'directions/back_to_main'
require_relative 'rooms/living_room'
require_relative 'rooms/open_space'
require_relative 'actions/exchange_snack'

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
    when 'openspace'
      open_space(input)
    when 'snack'
      exchange_snack(input)
    end
  end

  puts 'See you soon, bye!'
end
