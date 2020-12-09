# frozen_string_literal: true

require_relative 'card.rb'

class CardDeck
  attr_reader :deck, :cards_count

  def initialize
    @deck = []
    create
    @cards_count = @deck.size
    @deck.shuffle
  end

  def take_card
    card = @deck.pop
    card
  end

  private

  def create
    Card::VALUES.each do |num|
      Card::SUITS.each do |suit|
        @deck.push(Card.new(num, suit))
      end
    end
    @deck = @deck.shuffle
  end

end
