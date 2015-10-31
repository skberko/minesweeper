load 'board.rb'

class Tile
  attr_reader :board

  def initialize
    @board = Board.new
    @board.place_bombs
    # @bombed = false
    # @flagged = false
    # @revealed = false

  end

  # def display_bomb
  #   return :X if @board.latent_bomb?(pos) == true
  # end

  def flag_tile
    return 'F' if @board.flagged?(pos)
  end

  def reveal(pos)
    if @board.latent_bomb?(pos)
      return 'X'
    else
      # display_number

    end
  end


end

# tile = Tile.new
