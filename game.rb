# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize(players)
    @players = players
    @board = Board.new
  end

  def player_turn(player)
    move = player.get_move
    # p move
    # @board[1, 1] = player.marker
    @board[*move]=(player.marker)
    p @board.winner?(player.marker)
  end

  def display_board
    @board.display
  end
end
