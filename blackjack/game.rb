class Game

  attr_accessor :user_bank, :dealer_bank, :user_cards, :dealer_cards

  def initialize(user_name)
    @user_name = user_name
    @user_cards = []
    @dealer_cards = []
  end

  def take_user_card(card)
    @user_cards.push(card)
  end

  def take_dealer_card(card)
    @dealer_cards.push(card)
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

  # def end_game()
  #   if @user_cards == 3 && @dealer_cards = 3

  # end

end

