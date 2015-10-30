class Board
  attr_reader :board

  def initialize(board_width = 9, board_height = 9, mine_count = 10)
    @board = Array.new(board_height) { Array.new(board_width) }
    @mine_count = mine_count
  end

  def populate
    prev_rand_locations = []

    mine_count.times do
      random_location = self[rand(@board.size), rand(@board[0].size)]

      while random_location == :*
        random_location = self[rand(@board.size), rand(@board[0].size)]
      end
      random_location = :*
    end
  end

  def [](row, col)
    @board[row][col]
  end

  def []=(row, col, mark)
    @board[row][col] = mark
  end
end
