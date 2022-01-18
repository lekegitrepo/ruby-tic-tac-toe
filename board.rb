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

  def row_win?(marker)
    @grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_win?(marker)
    
  end

  def diagonal_win?(marker)
    
  end
end

def check_and_print(current_maker)
  @board.print_grid
  @board.row_win?(current_maker)
end

@board = Board.new
p check_and_print(:X)
@board.grid[0][0] = :X
p check_and_print(:X)
@board.grid[0][1] = :X
p check_and_print(:X)
@board.grid[0][2] = :X
p check_and_print(:X)
puts "X end"
puts "O start"
@board.grid[1][0] = :O
p check_and_print(:O)
@board.grid[1][1] = :O
p check_and_print(:O)
@board.grid[1][2] = :O
p check_and_print(:O)
