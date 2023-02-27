class Deck

  def initialize
    @deck = refresh_deck
  end

  def refresh_deck
    deck = []
    %w[2 3 4 5 6 7 8 9 10 J Q K A].each do |value|
      %w[+ <3 ^ <>].each do |suit|
        deck << value.to_s + suit.to_s
      end
    end
    deck
  end

  def deal_a_card(amount = 1)
    return @deck.delete(@deck.sample) if amount == 1

    cards = []
    (1..amount).each do
      cards << @deck.delete(@deck.sample)
    end
    cards
  end

  private

  attr_reader :deck
end
