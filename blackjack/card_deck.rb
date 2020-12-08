# frozen_string_literal: true

require_relative 'card.rb'

class CardDeck
  attr_reader :deck, :cards_count

  SUITS = %w[♠ ♥ ♣ ♦].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'V', 'D', 'K', 'T'].freeze

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
    VALUES.each do |num|
      SUITS.each do |suit|
        @deck.push(Card.new(num, suit))
      end
    end
    @deck = @deck.shuffle
  end

end
