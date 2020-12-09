# frozen_string_literal: true

class Card
  attr_reader :number, :suit, :value

  SUITS = %w[♠ ♥ ♣ ♦].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'V', 'D', 'K', 'T'].freeze

  def initialize(number, suit)
    @number = number
    @suit = suit
    @value = calculate_cost(number)
  end

  def calculate_ace(sum_cards)
    @value = if sum_cards <= 11
               11
             else
               1
             end
  end

  private

  def calculate_cost(number)
    if %w[V D K].include? number.to_s.upcase
      10
    elsif number.to_s.upcase == 'T'
      1
    else
      number.to_i
    end
  end
end
