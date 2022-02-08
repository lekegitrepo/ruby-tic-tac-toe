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

    play_game    
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
