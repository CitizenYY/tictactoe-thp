class UI
  PIECE_X = "X"
  PIECE_O = "0"

  def start
    play until finished?
    display_game
  end

  private

  def play
    display_game
    game.play(prompt_move)
  end

  def finished?
    game.won? || game.tie?
  end

  def display_game
    case
    when game.won? then puts "The game is now finished!\n#{game.other_player} won, congats!\n#{game.board}\n"
    when game.tie? then puts "The game is now finished!\nTie! Everybody win!\n#{game.board}\n"
    else                puts "#{game.current_player} where do you want to play?\n#{game.board}\n"
    end
  end

  def game
    @game ||= Game.new(*players).tap do |game|
      puts "\n#{game.current_player} will start playing! (it was random)\n"
    end
  end

  def players
    @players ||= [ prompt_player(PIECE_X), prompt_player(PIECE_O) ].shuffle
  end

  def prompt_player(piece)
    puts "\nPlayer (#{piece}), what's your name?"
    name = gets.chomp
    Player.new(name, piece)
  end

  def prompt_move
    loop do
      puts "Examples of valid input formats: A1, 1A, B3, ..."
      user_input = gets.chomp
      move = Move.parse(user_input)
      if move.nil?
        puts "Wrong format, try again"
      elsif !game.valid_move?(move)
        puts "Wrong spot, try again"
      else
        return move
      end
    end
  end
end
