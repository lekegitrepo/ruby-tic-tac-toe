# frozen_string_literal: true

require_relative 'game'
require_relative 'player'

class Session
  def initialize
    puts "Welcome to tic tac toe"

    @players = [
      Player.new('Laura', :X),
      Player.new('Marco', :O)
    ]
    @ties = 0
    play_loop   
  end

  def play_loop
    loop do
      puts "Starting a new game!"
      play_game
      puts display_score
      break unless play_again?
    end
    puts "Goodbye!"
  end

  def play_again?
    print "Play again? (y/n) \n > "
    answer = gets.strip[0].upcase
    case answer
    when 'Y'
      return true
    when 'N'
      return false
    else
      print "What was that? (type Y or N) \n > "
    end
  end

  def play_game
    game = Game.new(@players)
    winner = game.game_loop
    if winner
      puts "#{winner.name} won!"
      winner.increment_score
    else
      puts 'The game is a tie'
      @ties += 1
    end
    # p game
    # p game.player_turn(players[0])
    # puts game.display_board
  end

  def display_score
    score_array = ['', "The scores after #{game_played} games"]
    score_array = @players.map{ |player| "#{player.name} has won #{player.score} times" }
    score_array << "#{@player[0].name} and #{@player[1].name} have tied #{@ties} times"
    score_array << ''
  end

  def game_played
    @ties + @players.reduce(0) { |acc, el| acc + el.score }
  end
end
