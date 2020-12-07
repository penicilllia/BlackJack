require_relative 'hand.rb'
require_relative 'player.rb'

class Dealer < Player

  def move
    if @hand.sum_points < 17
      take_card
    end
  end

end
