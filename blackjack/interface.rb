# frozen_string_literal: true

require_relative 'card.rb'
require_relative 'card_deck.rb'
require_relative 'dealer.rb'
require_relative 'hand.rb'
require_relative 'player.rb'
require_relative 'user_player.rb'

class Interface
  def get_user_name
    puts 'Введите своё имя: '
    name = gets.chomp
    name
  end

  def first_cards(user, dealer)
    user.take_card
    user.take_card
    dealer.take_card
    dealer.take_card
  end

  def print_user_cards(player)
    puts
    puts 'Ваши карты: '
    player.hand.cards.each do |card|
      print card.number
      print ' '
      print card.suit
      print ',   '
    end
    puts
    puts "Ваш банк: #{player.bank}"
    puts "Ваша сумма очков: #{player.hand.count_points}"
  end

  def user_move
    puts
    puts 'Введите число, соответствующее вашему действию: '
    puts ' 1. Пропустить ход.'
    puts ' 2. Добавить карту.'
    puts ' 3. Открыть карты.'
    answer = gets.chomp.to_i
    answer
  end

  def print_dealer_info(player)
    puts
    puts 'Карты диллера: '
    player.hand.cards.each do |_card|
      print '* '
    end
    puts
    puts "Банк диллера: #{player.bank}"
  end

  def print_dealer_cards(player)
    puts
    puts 'Карты диллера: '
    player.hand.cards.each do |card|
      print card.number
      print ' '
      print card.suit
      print ',   '
    end
    puts
    puts "Банк диллера: #{player.bank}"
    puts "Сумма очков диллера: #{player.hand.count_points}"
  end

  def take_play_card(player)
    player.take_card
    calc_points(player)
  end

  def check_cards(user, dealer)
    if (user.hand.cards.size < 3) && (dealer.hand.cards.size < 3)
      true
    else
      false
    end
  end

  def print_winner(winner)
    puts
    if winner == 'dealer'
      puts 'Диллер выиграл!'
    elsif winner == 'user'
      puts 'Вы выиграли!'
    else
      puts 'Ничья!'
    end
  end

  def produce_game
    puts
    puts 'Вы хотите продолжить игру?'
    puts ' 1. Продолжить игру.'
    puts ' 2. Завершить игру.'
    user_chose = gets.chomp.to_i
    user_chose == 1
  end

  def clear_game(user, dealer)
    user.hand.cards.clear
    dealer.hand.cards.clear
  end

  def goodbye
    puts 'Спасибо за игру!'
  end

end
