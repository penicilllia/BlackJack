require_relative 'card.rb'

class HighCard < Card

  attr_accessor :value

  def initialize(number, suit)
    super 
    @value = calculate_cost(number)
  end

  def calculate_T(sum_cards)
    if sum_cards <= 10
      @value = 11
    end
  end

  private

  def calculate_cost(number)
    if ['V', 'D', 'K'].include? number.to_s.upcase
      10
    elsif number.to_s.upcase == 'T'
      1
    end
  end

end
