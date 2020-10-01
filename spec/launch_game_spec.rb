require "launch_game"

describe 'Launching the game' do
  it "should break the loop and exit on 'exit'" do
    expect { launch_game }.to output("[N.B. You can exit at any time by typing 'exit']\nHello stranger, are you ready for an adventure? (yes/no)\nSee you soon, bye!\n").to_stdout
  end
end
