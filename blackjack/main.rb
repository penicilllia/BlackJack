require_relative 'card.rb'
require_relative 'dealer.rb'
require_relative 'game.rb'
require_relative 'high_card.rb'

class GameProcess

  attr_accessor :user_bank, :dealer_bank

  def initialize
    @user_bank = 100
    @dealer_bank = 100
    @all_cards = []
  end

  def interface
    puts 'Введите ваше имя: '
    @user_name = gets.chomp 


  end

  def card_deck
    [2, 3, 4, 5, 6, 7, 8, 9, 10].each do |num|
      ['+', '<>', '<3', '^'].each do |suit|
        @all_cards.push(Card.new(num, suit))
      end
    end
    ['V', 'D', 'K', 'T'].each do |name|
      ['+', '<>', '<3', '^'].each do |suit|
        @all_cards.push(HighCard.new(name, suit))
      end
    end
    p @all_cards
  end


end
