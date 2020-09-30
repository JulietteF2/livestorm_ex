# Filter living room actions
def living_room(input)
  if input == 'shelves'
    check_blinky
  elsif input == 'fridge'
    check_snack
  elsif input == 'go back to the hall'
    back_to_main
  else
    puts INVALID
  end
end

def check_blinky
  if ARTEFACTS.include?('blinky')
    puts "\nNothing there... Maybe check the fridge or explore somewhere else ;)"
    pick_room('right')
  else
    ARTEFACTS << 'blinky'
    puts "\nWell done, you just found Blinky! This little PacMan Fantom is your number #{ARTEFACTS.count} artefact out of 3. Back to the living room now."
    pick_room('right')
  end
end

def check_snack
  if FOOD.empty?
    puts "\nLook at all those yums, let's grab a snack and keep it for later. Now back to exploration..."
    FOOD << 'snack'
    pick_room('right')
  else
    puts "\nYou already took one snack, let's not empty the entire fridge all right? Maybe check something else ;)"
    pick_room('right')
  end
end
