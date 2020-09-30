# Filter room actions according to input (right: living room, left: open space, forward: corridor)
def pick_room(input)
  if input == 'right'
    puts "\nYou're in the living room. Do you want to look at the shelves, open the fridge or go back to the hall? (shelves/fridge/go back to the hall)"
    KEEP_TRACK << 'livingroom'
  elsif input == 'left'
    puts "\nYou're in the open space. Tom is waving at you, maybe you should greet him...? (greet/go back to the hall)"
    KEEP_TRACK << 'openspace'
  elsif input == 'forward'
    check_if_artefacts
  else
    puts INVALID
  end
end

def check_if_artefacts
  if ARTEFACTS.count < 3
    puts "\nYou enter the corridor. At the end of it is our evil neighbour's door, but you still lack #{3 - ARTEFACTS.count} artefact(s). Let's go back."
    back_to_main
  else
    puts "\nYou enter the corridor. At the end of it is our evil neighbour's door, and you have all the artefacts to confront him! You're ready... let's enter? (yes/no)"
    KEEP_TRACK << 'bossroom'
  end
end
