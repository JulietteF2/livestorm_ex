require "session_setup/session"
require "session_setup/direction"
require "rooms/boss_room"

describe "#BossRoom#chose_action" do
  before do
    @session = Session.new
    @direction = Direction.new(@session)
    @boss_room = BossRoom.new(@session, @direction)
  end

  it "should call user chicken if 'no' is picked and go back" do
    expect { @boss_room.chose_action('no') }.to output(/.+chickening.+/).to_stdout
    expect(@session.track.last).to eq('hall')
  end

  it "should call fight if 'yes'" do
    expect { @boss_room.chose_action('yes') }.to output.to_stdout
    expect(@session.track.last).to eq('fight')
  end

  it "should wait for new input if a random one is passed" do
    expect { @boss_room.chose_action('mlep') }.to output("Sorry, your answer is not valid, please try again\n").to_stdout
  end
  it "shouldn't break if a random input is passed" do
    expect { @boss_room.chose_action('mlep') }.not_to raise_error
  end
end

describe "#BossRoom#fight" do
  before do
    @session = Session.new
    @direction = Direction.new(@session)
    @boss_room = BossRoom.new(@session, @direction)
  end

  it "should end the game on losing if user picks 'hang out for a bit'" do
    expect { @boss_room.fight('hang out for a bit') }.to output("\nHOW DARE YOU?\nSorry my dear but this is high treason. No one is allowed to 'hang out' with our competitors!\nYou lost.\n").to_stdout
  end
  it "should return false on 'hang out...' input" do
    expect(@boss_room.fight('hang out for a bit')).to eq(false)
  end

  it "should end the game on winning if user picks 'release the fantoms'" do
    expect { @boss_room.fight('release the fantoms') }.to output("\nOMG Blinky, Inky and Pinky are eating the power cables, all the servers are shutting down and thus....\nDestroying our competitor yaaaaaay!\nYou won, well done :)\n").to_stdout
  end
  it "should return false on 'release the fantoms' input" do
    expect(@boss_room.fight('hang out for a bit')).to eq(false)
  end

  it "should wait for new input if a random one is passed" do
    expect { @boss_room.fight('mlep') }.to output("Sorry, your answer is not valid, please try again\n").to_stdout
  end
  it "shouldn't break if a random input is passed" do
    expect { @boss_room.fight('mlep') }.not_to raise_error
  end
  it "should return true to random input" do
    expect(@boss_room.fight('mlep')).to eq(true)
  end
end
