require 'rspec'
require_relative 'reversi'

describe Board do
  subject(:board) { Board.new }

  describe "board" do
    its(:grid) { board.grid.length.should == 8}
    its (:grid) do
      board.grid.each do |x|
        x.length.should == 8
      end
    end
  end

  describe "boards initial pieces" do
    it "should have 4 pieces in the appropriate places to begin" do
      board.grid[3][3].should == :B
      board.grid[4][4].should == :B
      board.grid[3][4].should == :W
      board.grid[4][3].should == :W
    end
  end

end

describe Board do
  subject(:board) { Board.new }

  describe "should only let a player place its piece next to opponent" do
    it "should be able to place a piece adjacent to a piece of it's oppoenent" do
      board.show_board
      board.valid_move?([2, 3, :W]).should == true
    end

    it "should not be able to place a piece with no opponent pieces adjacent" do
      board.valid_move?([0, 0, :B]).should == false
    end

    it "should not be able to place a piece with only it's own pieces adjacent" do
      board.valid_move?([2, 5, :W]).should == false
    end
  end

end



