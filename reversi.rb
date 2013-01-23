class Board
  attr_accessor :grid
  ADJ=[[1,-1], [1, 0], [1, 1], [0, -1], [0, 1], [-1, -1], [-1, 0], [-1, 1]]
  def initialize
    @grid = generate_board
    @grid[3][3] = :B
    @grid[4][4] = :B
    @grid[3][4] = :W
    @grid[4][3] = :W
  end

  def valid_move?(move)
    row, col, color = move
    adjacents = adjacents(row, col)
    adjacents.include?(get_opposite_color(color))
  end

  def get_opposite_color(color)
    op_color = :W ? color == :B : op_color = :B
    # NR: you want to use ==, not =
    op_color
  end

  def adjacents(row, col)
    adjacents = []
    ADJ.each do |x, y|
      adjacents << @grid[row + x][col + y]
    end

    adjacents
  end

  def in_bounds?
  end

  def show_board
    puts
    print " "
    8.times do |i|
      print " #{i}"
    end
    puts
    @grid.each_with_index do |row, r_index|
      print r_index
      row.each do |square|
        if square == :_
          print " _"
        else
          print " #{square}"
        end
      end
      puts
    end
  end

  private

  def generate_board
    Array.new(8) do |row|
      Array.new(8) { |column| :_ }
    end
  end

end
