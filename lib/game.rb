require_relative "board"

class Game
  attr_reader :board

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @board = Board.new
  end

  def current_player
    @players.first
  end

  def other_player
    @players.last
  end

  def play(move)
    @board.set(move.row, move.col, current_player.piece)
    @players = @players.rotate
  end

  def valid_move?(move)
    @board.empty?(move.row, move.col)
  end

  def won?
    @board.three_in_a_row? || @board.three_in_a_col? || @board.three_in_a_diag?
  end

  def tie?
    @board.full? && !won?
  end
end
