require "session_setup/session"

describe "Session" do
  before do
    @session = Session.new
  end

  it "should have an invalid input error" do
    expect(@session.invalid).to eq('Sorry, your answer is not valid, please try again')
  end

  it "should set up artefacts, track and food variables" do
    expect(@session.artefacts).to eq([])
    expect(@session.track).to eq([])
    expect(@session.food).to eq(nil)
  end

  it "should return correct message when start_game is called" do
    expect { @session.start_game }.to output("[N.B. You can exit at any time by typing 'exit']\nHello stranger, are you ready for an adventure? (yes/no)\n").to_stdout
  end

  it "should return correct message when end_game is called" do
    expect { @session.end_game }.to output("See you soon, bye!\n").to_stdout
  end

  it "should set direction, and rooms when set_rooms is called" do
    @session.set_rooms
    expect(@session.direction).not_to eq(nil)
    expect(@session.living_room).not_to eq(nil)
    expect(@session.open_space).not_to eq(nil)
    expect(@session.boss_room).not_to eq(nil)
  end
end
