# frozen_string_literal: true

require_relative 'card.rb'
require_relative 'card_deck.rb'
require_relative 'dealer.rb'
require_relative 'interface.rb'
require_relative 'hand.rb'
require_relative 'player.rb'
require_relative 'user_player.rb'

class Main
  def main_game
    game = Interface.new
    name = game.get_user_name
    @game_status = true

    @deck = CardDeck.new
    @user_player = UserPlayer.new(name, 100, @deck)
    @dealer = Dealer.new('Dealer', 100, @deck)

    while @user_player.bank != 0 && @dealer.bank != 0
      @user_player.bank -= 10
      @dealer.bank -= 10
      game.first_cards(@user_player, @dealer)

      while @user_player.is_stopped == false && game.check_cards(@user_player, @dealer)
        game.print_dealer_info(@dealer)
        game.print_user_cards(@user_player)
        chose = game.user_move
        @user_player.move(chose)
        @dealer.move(chose)
      end

      game.print_dealer_cards(@dealer)
      game.print_user_cards(@user_player)

      calculate_winner
      winner = calculate_winner
      game.print_winner(winner)
      
      if game.produce_game == true
        @deck = CardDeck.new
        game.clear_game(@user_player, @dealer)
        @user_player.is_stopped = false
      else
        game.goodbye
        break
      end
    end
  end

  def calculate_winner
    winner = ''
    if @dealer.hand.count_points <= 21
      if @user_player.hand.count_points <= 21
        if @dealer.hand.count_points > @user_player.hand.count_points
          @dealer.bank += 20
          winner = 'dealer'
        elsif @dealer.hand.count_points < @user_player.hand.count_points
          @user_player.bank += 20
          winner = 'user'
        else
          @user_player.bank += 10
          @dealer.bank += 10
        end
      else
        @dealer.bank += 20
        winner = 'dealer'
      end
    elsif @user_player.hand.count_points <= 21
      winner = 'user'
      @user_player.bank += 20
    else
      @user_player.bank += 10
      @dealer.bank += 10
    end
    winner
  end

end
