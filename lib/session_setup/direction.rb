# Allow user's movements
class Direction
  def initialize(session)
    @session = session
  end

  def first_step(input)
    if input == 'yes'
    puts "\nGreat! I have a mission for you...  You just entered Livestorm headquarters and we need you to help us defeat our nasty neighbour but for that, you'll need to find 3 artefacts.\nWhere do you go? (right/left/forward)"
    @session.track << 'hall'
    elsif input == 'no'
      return false
    else
      puts @session.invalid
    end
    true
  end

  def pick_room(input)
    if input == 'right'
      puts "\nYou're in the living room. Do you want to look at the shelves, open the fridge or go back to the hall? (shelves/fridge/go back)"
      @session.track << 'livingroom'
    elsif input == 'left'
      puts "\nYou're in the open space. Tom is waving at you, maybe you should greet him...? (greet/go back)"
      @session.track << 'openspace'
    elsif input == 'forward'
      check_if_artefacts
    else
      puts @session.invalid
    end
  end

  def back_to_main
    puts "You're back at the entrance.\nWhere do you go? (right/left/forward)"
    @session.track << 'hall'
  end

  private

  def check_if_artefacts
    if @session.artefacts.count < 3
      puts "\nYou enter the corridor. At the end of it is our evil neighbour's door, but you still lack #{3 - @session.artefacts.count} artefact(s). Let's go back."
      back_to_main
    else
      puts "\nYou enter the corridor. At the end of it is our evil neighbour's door, and you have all the artefacts to confront him! You're ready... let's enter? (yes/no)"
      @session.track << 'bossroom'
    end
  end
end
