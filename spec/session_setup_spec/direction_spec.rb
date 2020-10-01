require "session_setup/session"
require "session_setup/direction"

describe "#Direction#first_step" do
  before do
    @session = Session.new
    @direction = Direction.new(@session)
  end

  it "should return false if user doesn't want to play and passes 'no'" do
    expect(@direction.first_step('no')).to eq(false)
  end
  it "should return true if user wants to play and passes 'yes'" do
    expect(@direction.first_step('yes')).to eq(true)
  end
  it "should update track with the right reference if 'yes'" do
    expect(@direction.first_step('yes')).to eq(true)
    expect(@session.track.last).to eq('hall')
  end
  it "should wait for new input if a random one is passed" do
    expect { @direction.first_step('mlep') }.to output("Sorry, your answer is not valid, please try again\n").to_stdout
  end
  it "shouldn't break if a random input is passed" do
    expect(@direction.first_step('mlep')).to eq(true)
  end
end

describe "Direction#pick_room" do
  before do
    @session = Session.new
    @direction = Direction.new(@session)
  end

  it "should update track accordingly" do
    @direction.pick_room('right')
    expect(@session.track.last).to eq('livingroom')
    @direction.pick_room('left')
    expect(@session.track.last).to eq('openspace')
  end
  it "should return to hall if less than 3 artefacts" do
    @direction.pick_room('forward')
    expect(@session.track.last).to eq('hall')
  end
  it "should check for 3 artefacts before boss" do
    @session.artefacts.push('Pinky', 'Inky', 'Blinky')
    @direction.pick_room('forward')
    expect(@session.track.last).to eq('bossroom')
  end
  it "should wait for new input if a random one is passed" do
    expect { @direction.pick_room('mlep') }.to output("Sorry, your answer is not valid, please try again\n").to_stdout
  end
  it "shouldn't break if a random input is passed" do
    expect { @direction.pick_room('mlep') }.not_to raise_error
  end
end

describe "Direction#back_to_main" do
  before do
    @session = Session.new
    @direction = Direction.new(@session)
  end

  it "should output the correct message and update track" do
    expect { @direction.back_to_main }.to output("You're back at the entrance.\nWhere do you go? (right/left/forward)\n").to_stdout
    expect(@session.track.last).to eq('hall')
  end
end
