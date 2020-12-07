require_relative 'hand.rb'
require_relative 'card_deck.rb'

class Player

  attr_accessor :bank, :hand
  attr_reader :name

  def initialize(name, bank, deck)
    @name = name
    @bank = bank
    @hand = Hand.new
    @deck = deck
  end

  def take_card
    @hand.cards.push(@deck.take_card)
  end

  def move
  end

end
