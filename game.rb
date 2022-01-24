# frozen_string_literal: true

require_relative 'board'

class Game
  def initialize(players)
    @players = players
    @board = Board.new
  end
end
