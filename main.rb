# frozen_string_literal: true

require './deck'
require './player'
require './user'
require './dealer'

class Main
  def init_players
    @player = User.new
    @player.new_balance(100)
    @dealer = Dealer.new
    @dealer.new_balance(100)
  end

  def init_deck
    @deck = Deck.new
  end

  def enter_user_name
    puts 'Enter username : '
    @player.new_name(gets.chomp.to_s)
  end

  def find_winner
    if @player.current_score == @dealer.current_score
      puts 'draw!'
      @player.add_balance(10)
      @dealer.add_balance(10)
    elsif @player.current_score <= 21 && @dealer.current_score > 21
      puts 'player won!'
      @player.add_balance(20)
    elsif @player.current_score > 21 && @dealer.current_score <= 21
      puts 'dealer won!'
      @dealer.add_balance(20)
    elsif @player.current_score > @dealer.current_score
      puts 'player won!'
      @player.add_balance(20)
    else
      puts 'dealer won!'
      @dealer.add_balance(20)
    end
    @bank = 0
  end

  def dealer_move
    if @dealer.current_score >= 17
      puts 'Dealer skipped move!'
    else
      puts 'Dealer took a card!'
      @dealer.take_a_card(@deck.deal_a_card)
      puts 'Dealer cards : '
      @dealer.show_hidden_cards
    end
  end

  def open_cards
    puts "#{@player.name} cards : "
    @player.show_cards
    puts "#{@player.name} score : #{@player.current_score}"
    puts 'Dealer cards : '
    @dealer.show_cards
    puts "Dealer score : #{@dealer.current_score}"
  end

  def player_takes_card
    puts "#{@player.name} taking a card.."
    @player.take_a_card(@deck.deal_a_card)
    puts "#{@player.name} cards : "
    @player.show_cards
    puts "#{@player.name} score : #{@player.current_score}"
  end

  def making_bets
    @player.make_a_bet(10)
    @dealer.make_a_bet(10)
  end

  def show_balances
    puts "Current player balance : #{@player.current_balance}"
    puts "Current dealer balance : #{@dealer.current_balance}"
  end

  def game
    @player.clear_hand
    @dealer.clear_hand
    show_balances
    @bank = 20
    puts "Bank is #{@bank}"
    @deck.refresh_deck
    making_bets
    @player.take_a_card(@deck.deal_a_card(2))
    @dealer.take_a_card(@deck.deal_a_card(2))
    puts "#{@player.name} cards : "
    @player.show_cards
    puts "#{@player.name} score : #{@player.current_score}"
    puts 'Dealer cards : '
    @dealer.show_hidden_cards
    puts 'check / take card / open cards ?'
    case gets.chomp.to_s
    when 'check'
      puts 'Dealer move'
      dealer_move
      puts 'Wanna one more card? (yes / no)'
      player_takes_card if gets.chomp.to_s == 'yes'
      open_cards
      find_winner
    when 'take card'
      player_takes_card
      dealer_move
      open_cards
      find_winner
    when 'open cards'
      open_cards
      find_winner
    end
  end

  def start
    init_players
    init_deck
    enter_user_name
    loop do
      if @player.current_balance < 10 || @dealer.current_balance < 10
        puts 'not enough money for play!'
        break
      end
      game
      puts 'Wanna another game? (yes / no)'
      if gets.chomp.to_s != 'yes'
        puts 'game is over!'
        break
      end
    end
  end
end
