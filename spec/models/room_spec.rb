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

  it "has a default capacity" do
    room.capacity.should == 10
  end

  it "can have a custom capacity" do
    my_room = Room.new "My room", 15
    my_room.capacity.should == 15
  end

  it "has a default turns count" do
    room.turns_count.should == 10
  end

  it "can have a custom turns count" do
    my_room = Room.new "My room", nil, 15
    my_room.turns_count.should == 15
  end

  it "can be full" do
    my_room = Room.new "My room", 1
    my_room.new_player "Gabriel"
    my_room.full?.should be_true
  end

  it "can be empty" do
    room.should be_empty 
  end

  describe "#new_player" do
    context "when full" do
      let(:room) { Room.new "My room", 0 }

      it "does not accept new player" do
        expect { room.new_player("Gabriel") }.to raise_error(Room::CannotJoinFullRoomException)
      end

    end

    context "when not full" do
      it "accepts new player" do
        room.new_player "Gabriel"
        room.players.should_not be_empty
      end
    end

  end

  describe "#remove_player" do
    context "when the player is not in the room" do
      before do
        room.new_player "Bob"
      end

      it "does nothing" do
        room.remove_player "Gabriel"
        room.players.size.should == 1
      end
    end

    context "when the player is in the room" do
      before do
        room.new_player "Gabriel"
      end

      it "removes the player" do
        room.remove_player "Gabriel"
        room.players.size.should == 0
      end
    end
  end

  describe "#new_game" do
    context "when there is not a current game" do
      it "creates a new game" do
        room.new_game
        room.has_current_game?.should be_true
      end

      it "creates new games with custom turns count" do
        my_room = Room.new "My room", 10, 15
        game = my_room.new_game
        game.turns_count.should == 15
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
end
