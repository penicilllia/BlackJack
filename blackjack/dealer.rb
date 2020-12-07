# frozen_string_literal: true

require_relative 'hand.rb'
require_relative 'player.rb'

class Dealer < Player
  def move
    take_card if @hand.sum_points < 17
  end
end
