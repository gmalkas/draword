class Room
  
  class HasOngoingGameException < RuntimeError; end
  class CannotJoinFullRoomException < RuntimeError; end

  attr_reader :capacity, :current_game, :name, :players

  DEFAULT_CAPACITY = 10

  def initialize(name, capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @name = name
    @players = []
  end

  def full?
    @players.size >= @capacity
  end

  def has_current_game?
    not @current_game.nil?
  end

  def new_game
    raise HasOngoingGameException if has_current_game?
    @current_game = ""
  end

  def new_player(player)
    raise CannotJoinFullRoomException if full?
    @players << player
  end

  def players
    @players
  end

end
