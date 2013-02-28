require 'ostruct'

class Room
  
  class HasOngoingGameException < RuntimeError; end
  class CannotJoinFullRoomException < RuntimeError; end

  attr_reader :capacity, :current_game, :name, :players, :turns_count

  DEFAULT_CAPACITY = 10
  DEFAULT_TURNS_COUNT = 10

  def initialize(name, capacity=DEFAULT_CAPACITY, turns_count=DEFAULT_TURNS_COUNT)
    @capacity = capacity
    @name = name
    @players = []
    @turns_count = turns_count
  end

  def empty?
    @players.empty?
  end

  def full?
    @players.size >= @capacity
  end

  def has_current_game?
    not @current_game.nil?
  end

  def new_game
    raise HasOngoingGameException if has_current_game?
    @current_game = OpenStruct.new turns_count: @turns_count
  end

  def new_player(player)
    raise CannotJoinFullRoomException if full?
    @players << player
  end

  def remove_player(player)
    @players.delete player
  end

  def players
    @players
  end

end
