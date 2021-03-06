# frozen_string_literal: true

require_relative 'input_helper'

class Player
  include InputHelper

  ROW_MAP = (:A..:C).zip(0..2).to_h

  TRANSLATIONS = {
    row: -> (input) { ROW_MAP[input[0].upcase.to_sym] },
    column: -> (input) { input.to_i - 1 }
  }

  attr_reader :marker, :name, :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end

  def score
    @score
  end

  def increment_score
    @score += 1
  end

  def get_move
    TRANSLATIONS.map do |row_or_column, translator|
      get_coordinates(row_or_column, translator)
    end
  end

  private

  def get_coordinates(row_or_column, translator)
    prompt "Pick a #{row_or_column}"
    loop do
      input = gets
      choice = translator.call(input)
      # method_to_call = "translate_#{row_or_column}".to_sym
      # choice = send(method_to_call, input)
      return choice if in_bounds?(choice)
      puts 'invalid move'
    end
  end

  # def get_col
  #   player_move_prompt('column')
  #   input = gets
  #   choice = translation_column(input)
  #   return choice if in_bounds?(choice)
  #   puts 'invalid move'
  # end

  # def translate_row(input)
  #   ROW_MAP[input[0].upcase.to_sym]
  # end

  # def translate_column(input)
  #   input.to_i - 1
  # end

  def in_bounds?(choice)
    (0..2).include?(choice)
  end

end
