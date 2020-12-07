# frozen_string_literal: true

class Hand
  attr_accessor :cards, :sum_points

  def initialize
    @cards = []
    @sum_points = 0
  end

  def count_points
    @sum_points = 0
    @cards.each do |card|
      @sum_points += card.value
    end
  end
end
