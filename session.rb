# frozen_string_literal: true

require_relative 'game'
require_relative 'player'

class Session
  def initialize
    @players = [
      Player.new('Laura', :X),
      Player.new('Marco', :O)
    ]
    @ties = 0
    play_loop
  end

  def play_loop
    puts "Welcome to tic tac toe"
    loop do
      puts "Starting a new game!"
      game = Game.new(@players)
      @winner = game.winner
      update_scores
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

  def update_scores
    @winner ? @winner.increment_score : @ties += 1
  end

  def announce_winner
    @winner ? "#{@winner.name} won!" : 'The game is a tie'
  end

  def display_score
    score_array = [announce_winner, '', "The scores after #{game_played} games"]
    score_array.concat(@players.map { |player| "#{player.name} has won #{player.score} times" })
    score_array << "#{@players[0].name} and #{@players[1].name} have tied #{@ties} times"
    score_array << ''
  end

  def game_played
    @ties + @players.reduce(0) { |acc, el| acc + el.score }
  end
end
