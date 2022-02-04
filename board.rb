# frozen_string_literal: true

class Board
  WIDTH = 3
  HEIGHT = WIDTH
  attr_accessor :grid

  def initialize
    @grid = Array.new(HEIGHT) { Array.new(WIDTH, :" ") }
  end

  def display
    @grid.each do |row|
      puts
      row.each do |cell|
        print "[#{cell}]"
      end
    end
    puts
  end

  # def display
  #   output = ''
  #   output << generate_header
  #   output << generate_rows
  # end

  def winner?(player)
    marker = player.marker
    row_win?(marker) || column_win?(marker) || diagonal_win?(marker)
  end

  def [](y, x)
    @grid [y][x]
  end

  def []=(y, x, value)
    if @grid[y][x] == :" " && [:X, :O].include?(value)
      @grid[y][x] = value
    else
      false
    end
  end

  private

  def generate_header
    (1..WIDTH).reduce('   ') { |header, row_number| header << "  #{row_number}" } << "\n"
  end

  def generate_rows
    letter = '@'
    @grid.reduce('') do |row_cells, row|
      letter = letter.next
      row_cells << format_row(row, letter)
      row_cells
    end
  end

  def format_row(row, letter)
    row.reduce("  #{letter} ") { |row_string, cell| row_string << "[#{cell}]" } << "\n"
  end

  def row_win?(marker)
    @grid.any? do |row|
      row.all? do |cell|
        cell == marker
      end
    end
  end

  def column_win?(marker)
    (0...WIDTH).any? do |column|
      @grid.all? do |row|
        row[column] == marker
      end
    end
  end

  def diagonal_win?(marker)
    [->(i) { i }, ->(i) { -(i + 1) }].any? do |proc|
      (0...HEIGHT).all? do |i|
        # second_index = sign > 0 ? i : sign * (i+1)
        @grid[i][proc.call(i)] == marker
      end
    end
  end
end

def check_and_print(current_maker)
  @board.print_grid
  @board.row_win?(current_maker) || @board.column_win?(current_maker) || @board.diagonal_win?(current_maker)
end

# @board = Board.new
# p check_and_print(:X)
# @board[0, 0] = :X
# p check_and_print(:X)
# @board[0, 1] = :X
# p check_and_print(:X)
# @board[0, 2] = :X
# p check_and_print(:X)
# puts "Row: X end"
# puts "Row: O start"
# @board[1, 0] = :O
# p check_and_print(:O)
# @board[1, 1] = :O
# p check_and_print(:O)
# @board[1, 2] = :O
# p check_and_print(:O)

# puts "Column: O start"
# @board[0, 2] = :O
# p check_and_print(:O)
# @board[1, 2] = :O
# p check_and_print(:O)
# @board[2, 2] = :O
# p check_and_print(:O)

# puts "Column: X start"
# @board[0, 1] = :X
# p check_and_print(:X)
# @board[1, 1] = :X
# p check_and_print(:X)
# @board[2, 1] = :X
# p check_and_print(:X)

# puts "Diagonal: O start"
# @board[0, 0] = :O
# p check_and_print(:O)
# @board[1, 1] = :O
# p check_and_print(:O)
# @board[2, 2] = :O
# p check_and_print(:O)

# puts "Diagonal: X start"
# @board[0, 2] = :X
# p check_and_print(:X)
# @board[1, 1] = :X
# p check_and_print(:X)
# @board[2, 0] = :X
# p check_and_print(:X)
