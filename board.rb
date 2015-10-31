class Board
  attr_reader :grid, :bomb_positions

  def initialize(col_count = 9, row_count = 9, mine_count = 10)
    @grid = Array.new(col_count) { Array.new(row_count) }
    @mine_count = mine_count
    @col_count = col_count
    @row_count = row_count
    @mine_count = mine_count
  end

  def place_bombs
    create_positions
    @bomb_positions.each { |position| self[*position] = :X }
  end

  def place_numbers
    (0...@row_count).each do |row_idx|
      (0...@col_count).each do |col_idx|
        position = [row_idx, col_idx]
        # arr = [1, 2]; [*arr] = [1, 2] - must do this because of syntactic sugard method
        unless self[*position] == :X
          self[*position] = surrounding_bomb_count(surrounding_positions(position))
        end
      end
    end
  end

  # returns an array of <= 8 positions, 1 for each
  # grid position surround argument 'pos'
  def surrounding_positions(pos)
    pos_adjustments = [
      [-1, 0], [1, 0], [0, 1], [0, -1],
      [-1,-1], [-1, 1], [1, 1], [1, -1]
    ]

    surrounding_positions = pos_adjustments.map do |cords|
      [cords[0] + pos[0], cords[1] + pos[1]]
    end

    surrounding_positions.select do |cords|
      cords[0].between?(0, @row_count) &&
      cords[1].between?(0, @col_count)
    end
  end

  def surrounding_bomb_count(surrounding_positions)
    surrounding_bomb_count = 0
    surrounding_positions.each do |pos|
      surrounding_bomb_count += 1 if @bomb_positions.include?(pos)
    end
    surrounding_bomb_count
  end

  def create_positions
    @bomb_positions = []

    until @bomb_positions.size == @mine_count
      rand_pos = [rand(@row_count), rand(@col_count)]
      @bomb_positions << rand_pos unless @bomb_positions.include?(rand_pos)
    end
    @bomb_positions
  end

  # pos will be array in format [row, col]
  def latent_bomb?(pos)
    @bomb_positions.include?(pos)
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, mark)
    @grid[row][col] = mark
  end
end
