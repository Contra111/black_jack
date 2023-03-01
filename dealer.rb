class Dealer < Player
  def show_hidden_cards
    @cards.length.times { print('* ') }
    puts
  end
end
