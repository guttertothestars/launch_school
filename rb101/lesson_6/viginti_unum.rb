require 'pry'
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

##################### HELPER METHODS #########################
def convert_aces(arr)
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

def bust?(hand) # seperate hand-numeric-conversion from bust method.
  total = []

  hand.each do |card|
    total << card[:card_value]
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

##################### DISPLAYS AND ART ############################
score_and_round = { player_score: 0, dealer_score: 0, current_round: 1 }

def display_scoreboard(game_data)
  puts "*" * 30
  puts "**         Round #{game_data[:current_round]}          **"
  puts "*" * 30
  print "** Player: #{game_data[:player_score]} "
  print "** Dealer: #{game_data[:dealer_score]}   **\n"
  puts "*" * 30
end

def show_player_hand(hand)
  index = 0

  puts "Your hand"
  puts "*#{'-' * 9}*"
  hand.size.times do
    if hand[index][:card_value] == 10
      puts "|#{hand[index][:card_value]} of #{hand[index][:suit]}  |"
    else
    puts "|#{hand[index][:card_value]}  of #{hand[index][:suit]}  |"
    end
  index += 1
  end
  puts "*#{'-' * 9}*"
end

def flash(msg)
  5.times do
    print "\r#{msg}"
    sleep 0.4
    print "\r#{' ' * msg.size}" # Send return and however many spaces are needed.
    sleep 0.4
    print "\r#{msg}"
  end
end

def card_art
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


##################### INITIALIZE DECK ############################
def initialize_deck_of_cards
  suits = ['♥', '♦', '♣', '♠']
  card_values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  deck = []

  suits.each do |current_suit|
    card_values.each do |current_value|
      new_card = { suit: current_suit, card_value: current_value }
      deck << new_card
    end
  end

  deck
end

DECK_OF_CARDS = initialize_deck_of_cards

######################### DEAL CARDS ###########################
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

def hit(deck, hand)
  hand << deck.sample
  deck.delete(hand.last)
end

##################### TURN METHODS ################################

def player_turn(deck, hand)
  loop do
    puts "hit or stay?"
    answer = gets.chomp
    break if answer == 'stay' || bust?(hand)
    hit(deck, hand)
  end
end

# 3. Player turn: hit or stay
#  - repeat until bust or "stay"
# 4. If player bust, dealer wins.

####################### GAME ###############################
card_art

# Hello, vilkomen, want rules?
DECK_OF_CARDS = initialize_deck_of_cards
current_deck = DECK_OF_CARDS.shuffle

player_hand = deal_hand(current_deck)
dealer_hand = deal_hand(current_deck)
show_player_hand

# display_hands # <--need to write this method

loop do # player turn loop
  if bust?(player_hand)
    flash("Dealer Wins!")
    score_and_round[:dealer_score] += 1
    score_and_round[:current_round] += 1
    break
  end

  player_turn(current_deck, player_hand)
  binding.pry
end

puts "fin"
