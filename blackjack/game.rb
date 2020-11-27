require_relative 'card.rb'
require_relative 'high_card.rb'

class Game
  attr_accessor :user_bank, :dealer_bank, :user_cards, :dealer_cards, :all_cards
  attr_reader :user_sum_points, :dealer_sum_points

  def initialize(user_name)
    @user_name = user_name
    @user_cards = []
    @dealer_cards = []
    @cards_count = 52
    @all_cards = []
    @user_sum_points = 0
    @dealer_sum_points = 0
  end

  def take_user_card
    card = random_element
    @user_cards.push(card)
    @user_sum_points += card.value
    clear_array
    @user_cards.each do |card| 
      if card.number == 'T'
        card.calculate_T(@user_sum_points)
      end
    end
  end

  def take_dealer_card
    card = random_element
    @dealer_cards.push(card)
    @dealer_sum_points += card.value
    clear_array
    @dealer_cards.each do |card|
      if card.number == 'T'
        card.calculate_T(@dealer_sum_points)
      end
    end
  end

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

  def print_user_cards
    puts
    puts 'Ваши карты: '
    @user_cards.each do |card|
      print card.number 
      print card.suit
      print '  '
    end
    puts
    print 'Ваша сумма очков: '
    puts @user_sum_points
  end

  def print_dealer_hidden_cards
    puts
    puts 'Карты диллера: '
    @dealer_cards.each do |card|
      print '* '
    end
    puts
  end

  def print_dealer_cards
    puts
    puts 'Карты диллера: '
    @dealer_cards.each do |card|
      print card.number 
      print card.suit
      print '  '
    end
    puts
    print 'Cумма очков диллера: '
    puts @dealer_sum_points
  end

  def user_move
    puts 'Ваш ход.'
    puts '1. Пропустить ход'
    puts '2. Добавить карту'
    puts '3. Открыть карты'
    user_chose = gets.chomp.to_i
    
    if user_chose == 2
      take_user_card
      dealer_move
    elsif user_chose == 1
      print_user_cards
      dealer_move
    elsif user_chose == 3
      end_game
    else
      puts 'Такого варианта нет!'
    end
  end
  
  def dealer_move
    if @dealer_sum_points < 17
      take_dealer_card
    end

    if @user_cards.size < 3
      user_move
    elsif @dealer_cards.size == 3
      end_game
    end
  end

  def end_game
    print_user_cards
    print_dealer_cards
  end

end

