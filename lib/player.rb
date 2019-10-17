class Player
  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  attr_reader :piece

  def to_s
    "#{@name} (#{@piece})"
  end
end
