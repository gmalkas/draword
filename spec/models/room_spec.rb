require_relative '../../app/models/room.rb'

describe Room do

  let(:room) { Room.new "My room" }

  it "starts without players" do
    room.players.should be_empty
  end

  it "starts without a current game" do
    room.has_current_game?.should be_false
  end

  it "has a name" do
    room.name.should == "My room"
  end

  it "accepts new player" do
    room.new_player "Gabriel"
    room.players.should_not be_empty
  end

  context "when there is not a current game" do
    it "can create a new game" do
      room.new_game
      room.has_current_game?.should be_true
    end
  end

  context "when there is a current game" do
    before do
      room.new_game
    end

    it "cannot create a new game" do
      expect { room.new_game }.to raise_error(Room::HasOngoingGameException)
    end
  end

end
