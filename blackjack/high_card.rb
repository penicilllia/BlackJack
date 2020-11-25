require_relative 'card.rb'

class HighCard < Card

  def initialize(number, suit)
    super 
    @value = calculate_cost(number)
  end

  def calculate_cost(number)
    if ['V', 'D', 'K'].include? number.to_s.upcase
      10
    elsif number.to_s.upcase == 'T'
      1
    end
  end

end
