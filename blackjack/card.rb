class Card

  attr_reader :number
  attr_accessor :value

  def initialize(number, suit)
    @number = number
    @suit = suit
    @value = calculate_cost(number)
  end

  def change_t(sum_point)
    if sum_point + 11 <= 21
      @value = 11
    else
      @value = 1
    end 
  end

  private 

  def calculate_cost(number)
    number.to_i
  end

end
