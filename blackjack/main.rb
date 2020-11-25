require_relative 'card.rb'
require_relative 'dealer.rb'
require_relative 'game.rb'
require_relative 'high_card.rb'

class GameProcess

  attr_accessor :user_bank, :dealer_bank

  def initialize
    @user_bank = 100
    @dealer_bank = 100
    
  end

  def interface
    puts 'Введите ваше имя: '
    @user_name = gets.chomp 
    puts 'Начинаем игру!'
    
    new_game = Game.new(@user_name)
    new_game.card_deck
    @user_bank -= 10
    @dealer_bank -= 10

    new_game.take_user_card
    new_game.take_user_card

    new_game.take_dealer_card
    new_game.take_dealer_card
    

  end

  # def card_deck
  #   (2 .. 10).to_a.each do |num|
  #     ['+', '<>', '<3', '^'].each do |suit|
  #       @all_cards.push(Card.new(num, suit))
  #     end
  #   end
  #   ['V', 'D', 'K', 'T'].each do |name|
  #     ['+', '<>', '<3', '^'].each do |suit|
  #       @all_cards.push(HighCard.new(name, suit))
  #     end
  #   end
  # end

  # def random_element
  #   @index = rand(@cards_count)
  #   @cards_count -= 1
  #   return @all_cards[@index]
  # end

  # def clear_array
  #   @all_cards.delete_at(@index)
  # end


end
