require_relative 'card.rb'
require_relative 'card_deck.rb'
require_relative 'dealer.rb'
require_relative 'game.rb'
require_relative 'hand.rb'
require_relative 'player.rb'
require_relative 'user_player.rb'

class Main

  def main_game
    
    game = Game.new
    name = game.get_user_name
    @game_status = true

    @deck = CardDeck.new
    @user_player = UserPlayer.new(name, 100, @deck)
    @dealer = Dealer.new('Dealer', 100, @deck)

    while @game_status == true && (@user_player.bank != 0 && @dealer.bank != 0) 
      @user_player.bank -= 10
      @dealer.bank -= 10

      @user_player.take_card
      @user_player.take_card
      @dealer.take_card
      @dealer.take_card

      game.calc_points(@user_player)
      game.calc_points(@dealer)

      while (@user_player.is_stopped == false) && (game.check_cards(@user_player, @dealer) == true)
        game.print_dealer_info(@dealer)
        game.print_user_cards(@user_player)
        chose = game.user_move
        @user_player.move(chose)
        @dealer.move
      end

      game.print_dealer_cards(@dealer)
      game.print_user_cards(@user_player)

      game.calculate_winner(@user_player, @dealer)
      if game.produce_game == true
        @deck = CardDeck.new
        game.clear_game(@user_player)
        game.clear_game(@dealer)
        @user_player.is_stopped == true
      else
        @game_status = false
        puts 'Спасибо за игру!'
      end
      puts '111111111111111111111111111111111111111111111111111111111111111111111111111111'

    end

  end



end
