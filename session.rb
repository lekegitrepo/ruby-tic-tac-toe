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
    play_loop   
  end

  def play_loop
    loop do
      puts "Starting a new game!"
      play_game
      break unless play_again?
    end
    puts "Goodbye!"
  end

  def play_again?
    print "Play again? (y/n) \n > "
    answer = gets.strip[0].upcase
    if answer == 'Y'
      return true
    elsif answer == 'N'
      return false
    else
      print "What was that? \n > "
    end
  end

  def play_game
    game = Game.new(@players)
    winner = game.game_loop
    if winner
      puts "#{winner.name} won!"
    else
      puts 'The game is a tie'
    end
    # p game
    # p game.player_turn(players[0])
    # puts game.display_board
  end
end
