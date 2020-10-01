# Open space's actions
class OpenSpace
  def initialize(session, direction)
    @session = session
    @direction = direction
  end

  def chose_action(input)
    if input == 'greet'
      if @session.artefacts.count < 2
        puts "\nTom says: 'Hello there! How is it going? I think I have something that could help you in your mission but I'm so hungry I can't remember what it is...'"
        check_if_food
      else
        puts "\nTom says: 'Thanks a lot for earlier, I hope Inky & Pinky will help you!'\nLooks like Tom has nothing left to give you, let's explore somewhere else."
        @direction.back_to_main
      end
    elsif input == 'go back'
      @direction.back_to_main
    else
      puts @session.invalid
    end
  end

  def check_if_food
    if @session.food.nil?
      puts "\nLooks like Tom can't help for now. Let's keep exploring."
      @direction.back_to_main
    else
      puts "\nYou have a snack in your pocket... do you want to give it to Tom? (yes/no)"
      @session.track << 'snack'
    end
  end

  def exchange_snack(input)
    if input == 'yes'
      @session.artefacts.push('inky', 'pinky')
      puts "\nSmart move, Tom is happy! He gives you... Inky & Pinky, two little PacMan Fantoms who'll join your artefacts collection yaaay. You now have #{@session.artefacts.count}/3 artefacts. Let's go back to the hall."
      @direction.back_to_main
    elsif input == 'no'
      puts "\nYou're not very nice... but ok, let's go back to the hall then."
      @direction.back_to_main
    else
      puts @session.invalid
    end
  end
end
