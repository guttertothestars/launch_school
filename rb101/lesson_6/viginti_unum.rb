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

def display_scoreboard(current_round, player_score, _computer_score)
  puts "******************************"
  puts "**         Round #{current_round}          **"
  puts "******************************"
  puts "** Player: #{player_score} ** Dealer: #{dealer_score} **"
  puts "******************************"
end

def flash(msg)
  5.times do
    print "\r#{msg}"
    sleep 0.5
    print "\r#{' ' * msg.size}" # Send return and however many spaces are needed.
    sleep 0.5
    print "\r#{msg}"
  end
end

def card_art()
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
  card_values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ['hearts', 'diamonds', 'clubs', 'spades']

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
card_art()

# Hello, vilkomen, want rules?

initialize_deck_of_cards
DECK_OF_CARDS = initialize_deck_of_cards
current_deck = DECK_OF_CARDS.shuffle

player_hand = deal_hand(current_deck)
dealer_hand = deal_hand(current_deck)

loop do #player turn loop
  if bust?(player_hand)
    puts "Dealer Wins!"
    break
  end

  player_turn(current_deck, player_hand)

end


# display_hands # <--need to write this method
