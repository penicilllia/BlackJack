# frozen_string_literal: true

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
    @hand.count_points
    @hand.cards.each_with_index do |card, index|
      @hand.cards[index].calculate_T(@hand.sum_points) if card.number == 'T'
    end
    @hand.count_points
  end

  def move; end
end
