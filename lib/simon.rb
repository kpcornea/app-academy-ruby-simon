class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "ok let's start..."
    sleep(2)

    until @game_over
      take_turn
      sleep(1)
      system("clear")
    end

    if @game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      round_success_message
      @sequence_length += 1
      @game_over = true if @sequence_length == 5
    end
  end

  def show_sequence
    add_random_color
    puts @seq
    sleep(1)
    system("clear")
  end

  def require_sequence
    puts "now you try. separate colors with a space."
    input = gets.chomp.split
    @game_over = true unless input == @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "nice one!!1"
    puts "-----------"
  end

  def game_over_message
    if @sequence_length == 5
      puts "you win!!!11"
    else
      puts "you lose..."
    end
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    play
  end
end


if __FILE__ == $PROGRAM_NAME
  a = Simon.new
  a.play
end
