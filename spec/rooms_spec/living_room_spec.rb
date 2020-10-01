require "session_setup/session"
require "session_setup/direction"
require "rooms/living_room"

describe "LivingRoom" do
  before do
    @session = Session.new
    @direction = Direction.new(@session)
    @living_room = LivingRoom.new(@session, @direction)
  end

  it "should call check_blinky if user picks shelves, and update artefacts" do
    expect { @living_room.chose_action('shelves') }.to output(/.+found Blinky.+/).to_stdout
    expect(@session.artefacts).to include('blinky')
  end

  it "should return to living room if user pick shelves and already has Blinky" do
    @session.artefacts << 'blinky'
    expect { @living_room.chose_action('shelves') }.to output(/.+Maybe check the fridge.+/).to_stdout
  end

  it "should call check_snack and update food if user picks fridge" do
    expect { @living_room.chose_action('fridge') }.to output(/.+all those yums.+/).to_stdout
    expect(@session.food).to eq('snack')
  end

  it "should return to living room if user pick fridge and already has snack" do
    @session.food = 'snack'
    expect { @living_room.chose_action('fridge') }.to output(/.+empty the entire fridge.+/).to_stdout
  end

  it "should return to main if user ask to 'go back to hall'" do
    expect { @living_room.chose_action('go back') }.to output(/.+back at the entrance.+/).to_stdout
    expect(@session.track.last).to eq('hall')
  end

  it "should wait for new input if a random one is passed" do
    expect { @living_room.chose_action('mlep') }.to output("Sorry, your answer is not valid, please try again\n").to_stdout
  end
  it "shouldn't break if a random input is passed" do
    expect { @living_room.chose_action('mlep') }.not_to raise_error
  end
end
