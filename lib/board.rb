class Board
  EMPTY = Object.new.freeze

  def initialize
    # Use the simplest thing first...
    @rows = [
      [EMPTY, EMPTY, EMPTY],
      [EMPTY, EMPTY, EMPTY],
      [EMPTY, EMPTY, EMPTY],
    ]
  end

  def set(row, col, piece)
    @rows[row][col] = piece
  end

  def empty?(row, col)
    @rows[row][col] == EMPTY
  end

  def full?
    @rows.all? { |cells| cells.all? { |cell| cell != EMPTY } }
  end

  def three_in_a_row?
    filled_with_same_thing?(@rows)
  end

  def three_in_a_col?
    filled_with_same_thing?(@rows.transpose)
  end

  def three_in_a_diag?
    # No idea if there is a common method to do that :/ I'll do it by hand :-(
    filled_with_same_thing?([
      [@rows[0][0], @rows[1][1], @rows[2][2]],
      [@rows[0][2], @rows[1][1], @rows[2][0]],
    ])
  end

  def to_s
    lines = ["  | 1 | 2 | 3 |"]
    lines << "--------------|"
    lines << "A | #{fetch(0, 0, " ")} | #{fetch(0, 1, " ")} | #{fetch(0, 2, " ")} |"
    lines << "--------------|"
    lines << "B | #{fetch(1, 0, " ")} | #{fetch(1, 1, " ")} | #{fetch(1, 2, " ")} |"
    lines << "--------------|"
    lines << "C | #{fetch(2, 0, " ")} | #{fetch(2, 1, " ")} | #{fetch(2, 2, " ")} |"
    lines.join("\n")
  end

  private

  def filled_with_same_thing?(array_of_cells)
    array_of_cells.any? { |cells| cells.first != EMPTY && cells.uniq.size == 1 }
  end

  def fetch(row, col, value_if_empty)
    value = @rows[row][col]
    value == EMPTY ? value_if_empty : value
  end
end
