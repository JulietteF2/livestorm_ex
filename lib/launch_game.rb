require 'readline'
require_relative 'session_setup/session'

def launch_game
  session = Session.new
  session.start_game
  session.set_rooms
  direction = session.direction
  living_room = session.living_room
  open_space = session.open_space
  boss_room = session.boss_room

  while input = Readline.readline("> ", true)
    break if input == 'exit'

    case session.track.last
    when nil
      direction.first_step(input) ? '' : break
    when 'hall'
      direction.pick_room(input)
    when 'livingroom'
      living_room.chose_action(input)
    when 'openspace'
      open_space.chose_action(input)
    when 'snack'
      open_space.exchange_snack(input)
    when 'bossroom'
      boss_room.chose_action(input)
    when 'fight'
      boss_room.fight(input) ? '' : break
    end
  end

  session.end_game
end
