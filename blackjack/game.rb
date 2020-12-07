require_relative 'card.rb'
require_relative 'card_deck.rb'
require_relative 'dealer.rb'
require_relative 'hand.rb'
require_relative 'player.rb'
require_relative 'user_player.rb'

class Game

  def get_user_name
    puts 'Введите своё имя: '
    name = gets.chomp
    name
  end

  def print_user_cards(player)
    puts 'Ваши карты: '
    player.hand.cards.each do |card|
      print card.number
      print ' '
      print card.suit
      print ',   '
    end
    puts
    puts "Ваш банк: #{player.bank}"
    puts "Ваша сумма очков: #{player.hand.sum_points}"
  end

  def user_move
    puts 'Введите число, соответствующее вашему действию: '
    puts ' 1. Пропустить ход.'
    puts ' 2. Добавить карту.'
    puts ' 3. Открыть карты.'
    answer = gets.chomp.to_i
    answer
  end

  def print_dealer_info(player)
    puts 'Карты диллера: '
    player.hand.cards.each do |card|
      print '* '
    end
    puts
    puts "Банк диллера: #{player.bank}"
    puts 
  end

  def print_dealer_cards(player)
    puts 'Карты диллера: '
    player.hand.cards.each do |card|
      print card.number
      print ' '
      print card.suit
      print ',   '
    end
    puts
    puts "Банк диллера: #{player.bank}"
    puts "Сумма очков диллера: #{player.hand.sum_points}"
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

  def calc_points(player)
    player.hand.count_points
    player.hand.cards.each do |card|
      if card.suit == 'T'
        card.calculate_T(player.hand.sum_points) 
      end
    end
  end

  def calculate_winner(user, dealer)
    if dealer.hand.sum_points <= 21
      if user.hand.sum_points <= 21
        if dealer.hand.sum_points > user.hand.sum_points
          puts 'Диллер выиграл!'
          dealer.bank += 20
        elsif dealer.hand.sum_points < user.hand.sum_points
          puts "Вы выиграли!"
          user.bank += 20
        else
          puts 'Ничья!'
          user.bank += 10
          dealer.bank += 10
        end
      else
        puts 'Диллер выиграл!'
        dealer.bank += 20
      end
    elsif user.hand.sum_points <= 21
      puts "Вы выиграли!"
      user.bank += 20
    else
      puts 'Ничья!'
      user.bank += 10
      dealer.bank += 10
    end
  end

  def produce_game
    puts 'Вы хотите продолжить игру?'
    puts ' 1. Продолжить игру.'
    puts ' 2. Завершить игру.'
    user_chose = gets.chomp.to_i
    user_chose == 1 ? true : false 
  end

  def clear_game(player)
    player.hand.cards.each do |card|
      player.hand.cards.delete(card)
    end
    player.hand.sum_points = 0
  end


end

