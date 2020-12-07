require_relative 'hand.rb'
require_relative 'player.rb'

class UserPlayer < Player

  attr_reader :is_stopped

  def initialize(name, bank, deck)
    super
    @is_stopped = false
  end
  
  def move(user_chose)
    if user_chose == 1
      @is_stopped = false
    elsif user_chose == 2
      take_card
    elsif user_chose == 3
      @is_stopped = true
    end
  end




end
