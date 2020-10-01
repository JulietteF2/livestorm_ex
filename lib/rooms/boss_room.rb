# Boss room's actions
class BossRoom
  def initialize(session, direction)
    @session = session
    @direction = direction
  end

  def chose_action(input)
    if input == 'yes'
      puts "\nO_O\nWhat's that?!?!\nGoogle Hangouts Offices?!\nYou have to do something! (hang out for a bit/release the fantoms)"
      @session.track << 'fight'
    elsif input == 'no'
      puts "\nSomeone is chickening...! All right, back to the hall."
      @direction.back_to_main
    else
      puts @session.invalid
    end
  end

  def fight(input)
    if input == 'hang out for a bit'
      puts "\nHOW DARE YOU?\nSorry my dear but this is high treason. No one is allowed to 'hang out' with our competitors!\nYou lost."
      false
    elsif input == 'release the fantoms'
      puts "\nOMG Blinky, Inky and Pinky are eating the power cables, all the servers are shutting down and thus....\nDestroying our competitor yaaaaaay!\nYou won, well done :)"
      false
    else
      puts @session.invalid
      true
    end
  end
end
