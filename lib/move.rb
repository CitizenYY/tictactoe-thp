class Move
  def self.parse(input)
    return nil unless input =~ /^([ABC][123])|([123][ABC])$/

    number, letter = input.each_char.sort
    row = letter.ord - 65
    col = number.to_i - 1
    new(row, col)
  end

  def initialize(row, col)
    @row = row
    @col = col
  end

  attr_reader :row, :col
end
