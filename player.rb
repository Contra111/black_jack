class Player
  def initialize
    @balance = 0
    @cards = []
  end

  def new_balance(balance)
    @balance = balance
  end

  def clear_hand
    @cards = []
  end

  def make_a_bet(amount)
    @balance -= amount
  end

  def show_cards
    @cards.each do |card|
      print "#{card} "
      puts
    end
  end

  def current_score
    @score = 0
    @cards.each do |card|
      @score += case card[0]
                when "J" || "Q" || "K"
                  10
                when
                  "A"
                  if score + 11 <= 21
                    11
                  else
                    1
                  end
                else
                  card.match(/\d{1,}/)[0].to_i
                end
    end
    @score
  end

  private

  attr_accessor :balance, :cards, :score
end
