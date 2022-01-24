# frozen_string_literal: true

require_relative 'game'
require_relative 'player'

players = [
  Player.new('Laura', :X),
  Player.new('Marco', :O)
]

game = Game.new(players)

puts players
p game
