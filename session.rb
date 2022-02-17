# frozen_string_literal: true

require_relative 'game'
require_relative 'player'

class Session
  def initialize
    puts "Welcome to tic tac toe"
    @players = [
      create_player(:X),
      create_player(:O)
    ]
    @ties = 0
    play_loop
    puts "Goodbye!"
  end

  def create_player(marker)
    print "Who want to play as player #{marker} \n> "
    name = gets.chomp.strip
    Player.new(name, marker)
  end

  def play_loop
    loop do
      puts "Starting a new game!"
      game = Game.new(game_played.even? ? @players : @players.reverse)
      update_scores(game.winner)
      puts score_board
      break unless play_again?
    end
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

  def update_scores(winner)
    winner ? winner.increment_score : @ties += 1
  end

  def score_board
    score_array = ['', "The score after #{game_played} game#{handle_plural(game_played)}"]
    score_array.concat(@players.map { |player| "#{player.name} has won #{player.score} time#{handle_plural(player.score)}" })
    score_array << "#{@players[0].name} and #{@players[1].name} have tied #{@ties} time#{handle_plural(@ties)}"
    score_array << ''
  end

  def game_played
    @ties + @players.reduce(0) { |acc, el| acc + el.score }
  end

  def handle_plural(value)
    's' unless value == 1
  end
end
