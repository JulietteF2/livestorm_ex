# Living room's actions
class LivingRoom
  def initialize(session, direction)
    @session = session
    @direction = direction
  end

  def chose_action(input)
    if input == 'shelves'
      check_blinky
    elsif input == 'fridge'
      check_snack
    elsif input == 'go back'
      @direction.back_to_main
    else
      puts @session.invalid
    end
  end

  def check_blinky
    if @session.artefacts.include?('blinky')
      puts "\nNothing there... Maybe check the fridge or explore somewhere else ;)"
    else
      @session.artefacts << 'blinky'
      puts "\nWell done, you just found Blinky! This little PacMan Fantom is your number #{@session.artefacts.count} artefact out of 3. Back to the living room now."
    end
    @direction.pick_room('right')
  end

  def check_snack
    if @session.food.nil?
      puts "\nLook at all those yums, let's grab a snack and keep it for later. Now back to exploration..."
      @session.food = 'snack'
    else
      puts "\nYou already took one snack, let's not empty the entire fridge all right? Maybe check something else ;)"
    end
    @direction.pick_room('right')
  end
end
