require_relative 'direction'
require_relative '../rooms/living_room'
require_relative '../rooms/open_space'
require_relative '../rooms/boss_room'

# Store user's current session infos
class Session
  attr_reader :invalid, :direction, :living_room, :open_space, :boss_room
  attr_accessor :track, :artefacts, :food

  def initialize
    @invalid = 'Sorry, your answer is not valid, please try again'
    @track = []
    @artefacts = []
    @food = nil
    @direction = nil
    @living_room = nil
    @open_space = nil
    @boss_room = nil
  end

  def start_game
    puts "[N.B. You can exit at any time by typing 'exit']\nHello stranger, are you ready for an adventure? (yes/no)\n"
  end

  def set_rooms
    @direction = Direction.new(self)
    @living_room = LivingRoom.new(self, @direction)
    @open_space = OpenSpace.new(self, @direction)
    @boss_room = BossRoom.new(self, @direction)
  end

  def end_game
    puts 'See you soon, bye!'
  end
end
