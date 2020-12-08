# frozen_string_literal: true

require_relative 'hand.rb'
require_relative 'player.rb'

class Dealer < Player
  def move(chose)
    if chose != 3 
      take_card if @hand.count_points < 17
    end
  end
end
