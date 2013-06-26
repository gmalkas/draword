class Game
  
  attr_reader :players, :turns_count

  def initialize(players, turns_count)
    @players = players
    @turns_count = turns_count
  end
  
  def new_player(player)
    @players << player
  end

end
