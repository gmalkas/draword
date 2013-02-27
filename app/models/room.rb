class Room
  
  class HasOngoingGameException < RuntimeError; end

  attr_reader :current_game, :name, :players

  def initialize(name)
    @name = name
    @players = []
  end

  def players
    @players
  end

  def has_current_game?
    not @current_game.nil?
  end

  def new_game
    raise HasOngoingGameException if has_current_game?
    @current_game = ""
  end

  def new_player(player)
    @players << player
  end


end
