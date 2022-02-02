# frozen_string_literal: true

class Player

  ROW_MAP = (:A..:C).zip(0..2).to_h

  attr_reader :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def get_move
    [get_row, get_col]
  end

  def get_row
    player_move_prompt('row')
    loop do
      input = gets
      choice = translation_row(input)
      return choice if choice
      puts 'invalid move'
    end
  end

  def get_col
    player_move_prompt('column')
    gets.to_i - 1
  end

  def translation_row(input)
    choice = ROW_MAP[input[0].upcase.to_sym]
    validate_choice(choice)
  end

  def validate_choice(choice)
    choice if (0..2).include?(choice)
  end

  def player_move_prompt(string)
    puts "Pick a #{string}"
    print '> '
  end
end
