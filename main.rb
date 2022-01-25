# frozen_string_literal: true

require_relative 'game'
require_relative 'player'

players = [
  Player.new('Laura', :X),
  Player.new('Marco', :O)
]

game = Game.new(players)

puts "Welcome to tic tac toe"

# puts players

# p game
game.player_turn(players[0])
game.print_board
