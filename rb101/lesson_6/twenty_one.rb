=begin
Broad Strokes Pseudo-code
0. Welcome and option for rules
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

########################### ART ######################################

def flash(msg)
  3.times do
    print "\r#{msg}"
    sleep 0.5
    print "\r#{' ' * msg.size}" # Send return and however many spaces are needed
    sleep 0.5
    print "\r#{msg}"
  end
end

def card_art
  system 'clear'
  puts "*---------*             "
  puts "|A        |             "
  puts "|         |             "
  puts "|    ♣    |  *---------*"
  puts "|         |  |10       |"
  puts "|        A|  |         |"
  puts "*---------*  |    ♣    |"
  puts "             |         |"
  puts "             |       10|"
  puts "             *---------*"
  flash("Welcome to 21!!!")
end

##################### CARD AND DECK METHODS ############################
def initialize_deck_of_cards # creates initial deck object
  suits = ['♥', '♦', '♣', '♠']
  card_values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  deck = []

  suits.each do |current_suit|
    card_values.each do |current_value|
      new_card = [current_suit, current_value]
      deck << new_card
    end
  end

  deck
end

DECK_OF_CARDS = initialize_deck_of_cards

# Add two cards to a hand and remove them from the current deck
def deal_hand(deck)
  hand = []
  2.times do
    hand << deck.sample
  end

  hand.each do |card|
    deck.delete(card)
  end

  hand
end

# Pull a card from the DECK
def hit(deck, hand)
  hand << deck.sample
  deck.delete(hand.last)
end

# ################DISPLAY METHODS#########################
def display_scoreboard(game_data)
  puts "*" * 30
  puts "**         Round #{game_data[:current_round]}          **"
  puts "*" * 30
  print "** Player: #{game_data[:player_score]} "
  print "** Dealer: #{game_data[:dealer_score]}   **\n"
  puts "*" * 30
  puts ""
end

def show_player_hand(hand)
  index = 0

  puts "Your hand:"
  puts "*#{'-' * 8}*"
  hand.size.times do
    if hand[index].last == 10
      puts "|#{hand[index].last} of  #{hand[index].first}|"
    else
      puts "|#{hand[index].last}  of  #{hand[index].first}|"
    end
    index += 1
  end
  puts "*#{'-' * 8}*"
  puts ""
end

def show_dealer_hand(hand)
  index = 0

  puts "Dealer hand:"
  puts "*#{'-' * 8}*"
  1.times do
    if hand[index].last == 10
      puts "|#{hand[index].last} of  #{hand[index].first}|"
    else
      puts "|#{hand[index].last}  of  #{hand[index].first}|"
    end
    index += 1
  end
  (hand.size - 1).times do
    puts "|*  of  *|"
  end
  puts "*#{'-' * 8}*"
  puts ""
end

def clear_and_show_details(game_data, hand1, hand2)
  system 'clear'
  display_scoreboard(game_data)
  show_player_hand(hand1)
  show_dealer_hand(hand2)
end

###################### GAMEPLAY METHODS ####################
def convert_aces(arr) # converts aces to 1s to avoid busting
  if arr.sum > 21
    arr.map! do |el|
      if el == 11
        1
      else
        el
      end
    end
  end
  arr.sum
end

def bust?(hand)
  total = []

  hand.each do |card|
    total << card[1]
  end

  total.map! do |element| # converts face cards to integer values
    if element == "A"
      11
    elsif element == "J" || element == "Q" || element == "K"
      10
    else
      element
    end
  end

  total = convert_aces(total)
  total > 21 # will return the boolean we need to answer bust? T/F
end

def anyone_busted?(game_data, hand1, hand2)
  if bust?(hand1)
    game_data[:dealer_score] += 1
    game_data[:current_round] += 1
    clear_and_show_details(game_data, hand1, hand2)
    flash("You Busted! Dealer Wins!")
  elsif bust?(hand2)
    game_data[:player_score] += 1
    game_data[:current_round] += 1
    clear_and_show_details(game_data, hand1, hand2)
    flash("The Dealer Busted! You Win!")
  else
    false
  end
end

def will_dealer_hit?(hand)
  total = []

  hand.each do |card|
    total << card[1]
  end

  total.map! do |element| # converts face cards to integer values
    if element == "A"
      11
    elsif element == "J" || element == "Q" || element == "K"
      10
    else
      element
    end
  end

  total = convert_aces(total)
  total < 17 # will return the boolean we need to answer if dealer will hit
end

def player_turn(deck, game_data, hand1, hand2)
  loop do
    puts "Would you like to hit or stay?"
    answer = gets.chomp.downcase

    case answer
    when "hit"
      hit(deck, hand1)
      clear_and_show_details(game_data, hand1, hand2)
    when "stay"
      break
    else
      puts "Please hit or stay"
    end

    break if bust?(hand1)
  end

  clear_and_show_details(game_data, hand1, hand2)
end

def dealer_turn(deck, game_data, hand1, hand2)
  loop do
    case will_dealer_hit?(hand2)
    when true
      puts "Dealer hits"
      hit(deck, hand2)
      clear_and_show_details(game_data, hand1, hand2)
    when false
      puts "Dealer stays"
      break
    end

    break if bust?(hand2)
  end
  clear_and_show_details(game_data, hand1, hand2)
end

def compare_cards_and_declare_winner(game_data, hand1, hand2)
  player_total = []

  hand1.each do |card|
    player_total << card[1]
  end

  player_total.map! do |element| # converts face cards to integer values
    if element == "A"
      11
    elsif element == "J" || element == "Q" || element == "K"
      10
    else
      element
    end
  end
  player_total = convert_aces(player_total)

  dealer_total = []

  hand2.each do |card|
    dealer_total << card[1]
  end

  dealer_total.map! do |element| # converts face cards to integer values
    if element == "A"
      11
    elsif element == "J" || element == "Q" || element == "K"
      10
    else
      element
    end
  end
  dealer_total = convert_aces(dealer_total)

  if dealer_total >= player_total
    game_data[:dealer_score] += 1
    game_data[:current_round] += 1
    flash("Dealer wins the round!")
    clear_and_show_details(game_data, hand1, hand2)
  else
    game_data[:player_score] += 1
    game_data[:current_round] += 1
    flash("You win the round!")
    clear_and_show_details(game_data, hand1, hand2)
  end
end

####################### GAME ###############################
card_art

# Hello, vilkomen, want rules?
score_and_round = { player_score: 0, dealer_score: 0, current_round: 1 }

loop do # game_loop
  if score_and_round[:player_score] == 3
    system 'clear'
    display_scoreboard(score_and_round)
    flash("You win the tournament!")
    break
  elsif score_and_round[:dealer_score] == 3
    system 'clear'
    display_scoreboard(score_and_round)
    flash("The house always wins?")
    break
  end

  if score_and_round[:current_round] != 1
    system 'clear'
    flash("Round #{score_and_round[:current_round]}")
  end

  #shuffle a fresh deck and deal the cards
  current_deck = DECK_OF_CARDS.shuffle
  player_hand = deal_hand(current_deck)
  dealer_hand = deal_hand(current_deck)

  loop do # match loop
    clear_and_show_details(score_and_round, player_hand, dealer_hand)

    player_turn(current_deck, score_and_round, player_hand, dealer_hand)
    if anyone_busted?(score_and_round, player_hand, dealer_hand)
      break
    end
    # clear_and_show_details(score_and_round, player_hand, dealer_hand)

    dealer_turn(current_deck, score_and_round, player_hand, dealer_hand)
    if anyone_busted?(score_and_round, player_hand, dealer_hand)
      break
    end

    compare_cards_and_declare_winner(score_and_round, player_hand, dealer_hand)
    break
  end
end
