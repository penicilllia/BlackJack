class Card

  attr_reader :number, :suit, :value

  def initialize(number, suit)
    @number = number
    @suit = suit
    @value = calculate_cost(number)
  end

  private 

  def calculate_cost(number)
    number.to_i
  end

end
