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
    until @winner || !@board.space_left? do
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

    loop do
      target_cell = player.get_move
      # p move
      # @board[1, 1] = player.marker
      break if @board.place_marker(target_cell, player.marker)
      puts "Invalid move the space you picked is already taken"
    end

    @winner = player if @board.winner?(player)
  end
end
