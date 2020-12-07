require_relative 'card.rb'
require_relative 'game.rb'
require_relative 'card_deck.rb'
require_relative 'dealer.rb'
require_relative 'hand.rb'
require_relative 'player.rb'
require_relative 'user_player.rb'

class GameProcess

  attr_accessor :user_bank, :dealer_bank

  def initialize
   
  end

  def interface
    puts 'Введите ваше имя: '
    @user_name = gets.chomp 
    puts 'Начинаем игру!'
    @user_chose = 1
      
    while @user_chose != 2      
      @new_game = Game.new(@user_name)
      @new_game.card_deck
      @user_bank -= 10
      @dealer_bank -= 10
      @rate += 20

      puts
      puts '******************************************************'

      @new_game.take_user_card
      @new_game.take_user_card

      @new_game.take_dealer_card
      @new_game.take_dealer_card

      @new_game.print_user_cards
      puts 
      puts "Ваш счет: #{@user_bank}"

      @new_game.print_dealer_hidden_cards
      puts 
      puts "Счет диллера: #{@dealer_bank}"

      @new_game.user_move
      end_current_game

      puts 
      puts 'Желаете продолжить игру? (1 -- да, 2 -- нет)'
      @user_chose = gets.chomp.to_i

      if @user_chose == 2
        puts 'Спасибо за игру!'
      end

      if @user_bank == 0 || @dealer_bank == 0
        puts 'Партия окончена!'
        @user_chose = 2
      end
    end
  end

  def end_current_game
    if @new_game.dealer_sum_points <= 21
      if @new_game.user_sum_points <= 21
        if @new_game.dealer_sum_points > @new_game.user_sum_points
          puts 'Диллер выиграл!'
          @dealer_bank += @rate
        elsif @new_game.dealer_sum_points < @new_game.user_sum_points
          puts "#{@user_name}, вы выиграли!"
          @user_bank += @rate
        else
          puts 'Ничья!'
          @user_bank += 10
          @dealer_bank += 10
        end
      else
        puts 'Диллер выиграл!'
        @dealer_bank += @rate
      end
    elsif @new_game.user_sum_points <= 21
      puts "#{@user_name}, вы выиграли!"
      @user_bank += @rate
    else
      puts 'Ничья!'
      @user_bank += 10
      @dealer_bank += 10
    end
    @rate = 0
  end

end
