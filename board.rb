class Board
  attr_reader :board

  def initialize(col_count = 9, row_count = 9, mine_count = 10)
    @board = Array.new(col_count) { Array.new(row_count) }
    @mine_count = mine_count
    @col_count = col_count
    @row_count = row_count
  end

  def populate
    positions = create_positions
    positions.each { |positions| self[position] = :X }
  end

  def create_positions
    positions = []

    until rand_locations.size == mine_count
      rand_pos = [rand(@row_count), rand(@col_count)]
      positions << rand_pos unless positions.include?(rand_pos)
    end
    positions
  end

  def [](row, col)
    @board[row][col]
  end

  def []=(row, col, mark)
    @board[row][col] = mark
  end
end
