require "session_setup/session"
require "session_setup/direction"
require "rooms/open_space"

describe "OpenSpace#chose_action" do
  before do
    @session = Session.new
    @direction = Direction.new(@session)
    @open_space = OpenSpace.new(@session, @direction)
  end

  it "should greet Tom if user picked 'greet'" do
    expect { @open_space.chose_action('greet') }.to output(/Tom says.+/).to_stdout
  end
  it "should return to main if user ask to 'go back to hall'" do
    expect { @open_space.chose_action('go back') }.to output(/.+back at the entrance.+/).to_stdout
    expect(@session.track.last).to eq('hall')
  end

  it "should check if user already has Inky & Pinky if user picks greet" do
    expect { @open_space.chose_action('greet') }.to output(/.+I'm so hungry.+/).to_stdout
    @session.artefacts.push('inky', 'pinky')
    expect { @open_space.chose_action('greet') }.to output(/.+Thanks a lot.+/).to_stdout
  end

  it "should redirect to hall if user already has artefacts" do
    @session.artefacts.push('inky', 'pinky')
    expect { @open_space.chose_action('greet') }.to output(/.+Thanks a lot.+/).to_stdout
    expect(@session.track.last).to eq('hall')
  end

  it "should check for food if user doesn't have artefacts" do
    expect { @open_space.chose_action('greet') }.to output(/.+Tom can't help.+/).to_stdout
  end

  it "should allow exchange if no artefacts but food" do
    @session.food = 'snack'
    expect { @open_space.chose_action('greet') }.to output(/.+snack in your pocket.+/).to_stdout
    expect(@session.track.last).to eq('snack')
  end

  it "should wait for new input if a random one is passed" do
    expect { @open_space.chose_action('mlep') }.to output("Sorry, your answer is not valid, please try again\n").to_stdout
  end
  it "shouldn't break if a random input is passed" do
    expect { @open_space.chose_action('mlep') }.not_to raise_error
  end
end

describe "#OpenSpace#exchange_snack" do
  before do
    @session = Session.new
    @direction = Direction.new(@session)
    @open_space = OpenSpace.new(@session, @direction)
  end

  it "should not thank user if 'no' is picked" do
    expect { @open_space.exchange_snack('no') }.to output(/.+not very nice.+/).to_stdout
  end
  it "should not add 'inky' and 'pinky' to ARTEFACTS if user picks 'no'" do
    expect { @open_space.exchange_snack('no') }.to output(/.+not very nice.+/).to_stdout
    expect(@session.artefacts[-2..-1]).not_to eq(['inky', 'pinky'])
  end
  it "should update track to hall when 'no'" do
    expect { @open_space.exchange_snack('no') }.to output(/.+not very nice.+/).to_stdout
    expect(@session.track.last).to eq('hall')
  end

  it "should thank user for snack if 'yes' is picked" do
    expect { @open_space.exchange_snack('yes') }.to output(/.+Tom is happy!.+/).to_stdout
  end
  it "should add 'inky' and 'pinky' to ARTEFACTS if user picks 'yes'" do
    expect { @open_space.exchange_snack('yes') }.to output(/.+Tom is happy!.+/).to_stdout
    expect(@session.artefacts[-2..-1]).to eq(['inky', 'pinky'])
  end

  it "should update track to hall when 'yes'" do
    expect { @open_space.exchange_snack('yes') }.to output(/.+Tom is happy!.+/).to_stdout
    expect(@session.track.last).to eq('hall')
  end

  it "should wait for new input if a random one is passed" do
    expect { @open_space.exchange_snack('mlep') }.to output("Sorry, your answer is not valid, please try again\n").to_stdout
  end
  it "shouldn't break if a random input is passed" do
    expect { @open_space.exchange_snack('mlep') }.not_to raise_error
  end
end
