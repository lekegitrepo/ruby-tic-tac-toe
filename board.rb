# frozen_string_literal: true

class Board
  WIDTH = 3
  HEIGHT = WIDTH
  attr_accessor :grid

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ") }
  end

  def print_grid
    @grid.each do |row|
      puts
      row.each do |cell|
        print "[#{cell}]"
      end
    end
    puts
  end
end

board = Board.new
board.print_grid
board.grid[0][1] = :X
board.print_grid
