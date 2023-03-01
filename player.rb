class Player
  def initialize
    @balance = 0
    @cards = []
  end

  def new_balance(balance)
    @balance = balance
  end

  def add_balance(cash)
    @balance += cash
  end

  def clear_hand
    @cards = []
  end

  def make_a_bet(amount)
    @balance -= amount
  end

  def current_balance
    @balance
  end

  def take_a_card(cards)
    @cards.concat(Array(cards))
  end

  def show_cards
    puts @cards.join(' ')
  end

  def current_score
    @score = 0
    @cards.each do |card|
      @score += case card[0]
                when 'J'
                  10
                when 'Q'
                  10
                when 'K'
                  10
                when
                  'A'
                  if @score + 11 <= 21
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
end
