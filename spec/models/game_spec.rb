require_relative '../../app/models/game.rb'

describe Game do

  let(:game) { Game.new [], 10 }

  it "can be initialized" do
    game.players.should == []
    game.turns_count.should == 10
  end

  it "can have new players" do
    game.new_player "Gabriel"
    game.players.size.should == 1
  end

  it "can remove players" do
  end

end
