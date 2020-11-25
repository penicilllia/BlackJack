require_relative 'card.rb'
require_relative 'high_card.rb'

class Game

  attr_accessor :user_bank, :dealer_bank, :user_cards, :dealer_cards, :all_cards


  def initialize(user_name)
    @user_name = user_name
    @user_cards = []
    @dealer_cards = []
    @cards_count = 52
    @all_cards = []
  end

  def take_user_card
    card = random_element
    @user_cards.push(card)
    clear_array
  end

  def take_dealer_card
    card = random_element
    @dealer_cards.push(card)
    clear_array
  end

  def hide_dealer_cards(*cards)
    hidden_cards = []
    cards.each do |card|
      hidden_cards.push('*')
    end
  end

  def dealer_move(sum_point, card)
    if sum_point < 17
      take_dealer_card(card)
    end
  end

#################################################

  def random_element
    @index = rand(@cards_count)
    @cards_count -= 1
    return @all_cards[@index]
  end

  def clear_array
    @all_cards.delete_at(@index)
  end

  def card_deck
    (2 .. 10).to_a.each do |num|
      ['+', '<>', '<3', '^'].each do |suit|
        @all_cards.push(Card.new(num, suit))
      end
    end
    ['V', 'D', 'K', 'T'].each do |name|
      ['+', '<>', '<3', '^'].each do |suit|
        @all_cards.push(HighCard.new(name, suit))
      end
    end
  end



  # def end_game()
  #   if @user_cards == 3 && @dealer_cards = 3

  # end

end

