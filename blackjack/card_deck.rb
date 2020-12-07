# frozen_string_literal: true

require_relative 'card.rb'

class CardDeck
  attr_reader :deck, :cards_count

  def initialize
    @deck = []
    create
    @cards_count = @deck.size
  end

  def take_card
    card = random_element
    clear_array
    card
  end

  private

  def create
    (2..10).to_a.each do |num|
      ['+', '<>', '<3', '^'].each do |suit|
        @deck.push(Card.new(num, suit))
      end
    end
    %w[V D K T].each do |name|
      ['+', '<>', '<3', '^'].each do |suit|
        @deck.push(Card.new(name, suit))
      end
    end
  end

  def random_element
    @index = rand(@cards_count)
    @cards_count -= 1
    @deck[@index]
  end

  def clear_array
    @deck.delete_at(@index)
  end
end
