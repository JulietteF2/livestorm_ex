# Filter open space actions
def open_space(input)
  if input == 'greet'
    if !ARTEFACTS.include?('inky')
      puts "\nTom says: 'Hello there! How is it going? I think I have something that could help you in your mission but I'm so hungry I can't remember what it is...'"
      check_if_food
    else
      puts "\nTom says: 'Thanks a lot for earlier, I hope Inky & Pinky will help you!'\nLooks like Tom has nothing left to give you, let's explore somewhere else."
      back_to_main
    end
  elsif input == 'go back to the hall'
    back_to_main
  else
    puts INVALID
  end
end

def check_if_food
  if FOOD.empty?
    puts "\nLooks like Tom can't help for now. Let's keep exploring."
    back_to_main
  else
    puts "\nYou have a snack in your pocket... do you want to give it to Tom? (yes/no)"
    KEEP_TRACK << 'snack'
  end
end
