require "launch_game"

describe 'Launching the game' do
  it "should break the loop and exit on 'exit'" do
    expect { launch_game }.to output("[N.B. You can exit at any time by typing 'exit']\nHello stranger, are you ready for an adventure? (yes/no)\nSee you soon, bye!\n").to_stdout
  end

  it 'should set empty constants' do
    expect(KEEP_TRACK).to eq([])
    expect(ARTEFACTS).to eq([])
    expect(FOOD).to eq([])
  end
end

describe "# first_step" do
  it "should return false if user doesn't want to play and passes 'no'" do
    expect(first_step('no')).to eq(false)
  end
  it "should return true if user wants to play and passes 'yes'" do
    expect(first_step('yes')).to eq(true)
  end
  it "should update KEEP_TRACK with the right reference if 'yes'" do
    expect(KEEP_TRACK.last).to eq('hall')
  end
  it "should wait for new input if a random one is passed" do
    expect { first_step('mlep') }.to output("Sorry, your answer is not valid, please try again\n").to_stdout
  end
  it "shouldn't break if a random input is passed" do
    expect(first_step('mlep')).to eq(true)
  end
end

describe "# pick_room" do
  it "should update KEEP_TRACK accordingly" do
    pick_room('right')
    expect(KEEP_TRACK.last).to eq('livingroom')
    pick_room('left')
    expect(KEEP_TRACK.last).to eq('openspace')
  end
  it "should return to hall if less than 3 artefacts" do
    pick_room('forward')
    expect(KEEP_TRACK.last).to eq('hall')
  end
  it "should check for 3 artefacts before boss" do
    ARTEFACTS.push('Pinky', 'Inky', 'Blinky')
    pick_room('forward')
    expect(KEEP_TRACK.last).to eq('bossroom')
  end
  it "should wait for new input if a random one is passed" do
    expect { pick_room('mlep') }.to output("Sorry, your answer is not valid, please try again\n").to_stdout
  end
  it "shouldn't break if a random input is passed" do
    expect { pick_room('mlep') }.not_to raise_error
  end
end

describe "# back_to_main" do
  it "should output the correct message" do
    expect { back_to_main }.to output("You're back at the entrance.\nWhere do you go? (right/left/forward)\n").to_stdout
  end
  it "should update KEEP_TRACK with the right reference" do
    expect(KEEP_TRACK.last).to eq('hall')
  end
end
