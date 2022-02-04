# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize(players)
    @players = players
    @board = Board.new
    @winner = nil
  end

  def game_loop
    current_player, other_player = @players
    until @winner do
      player_turn(current_player)
      current_player, other_player = other_player, current_player
    end
    puts @board.display
    @winner
  end

  def player_turn(player)

    # puts current_player.marker
    puts @board.display
    # puts "It's your turn #{current_player.name}, you are player #{current_player.marker}"
    puts "It's your turn player #{player.marker}"

    move = player.get_move
    # p move
    # @board[1, 1] = player.marker
    @board[*move]=(player.marker)

    @winner = player if @board.winner?(player)
  end
end
