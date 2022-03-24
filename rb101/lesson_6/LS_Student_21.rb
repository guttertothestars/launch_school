require 'yaml'

MESSAGES = YAML.load_file('21_messages.yml')
DECK = { 'Spades': [{ '2': 2 }, { '3': 3 }, { '4': 4 }, { '5': 5 },
                    { '6': 6 }, { '7': 7 }, { '8': 8 }, { '9': 9 },
                    { '10': 10 }, { 'Jack': 10 }, { 'Queen': 10 },
                    { 'King': 10 }, { 'Ace': 11 }],
         'Clubs': [{ '2': 2 }, { '3': 3 }, { '4': 4 }, { '5': 5 },
                   { '6': 6 }, { '7': 7 }, { '8': 8 }, { '9': 9 },
                   { '10': 10 }, { 'Jack': 10 }, { 'Queen': 10 },
                   { 'King': 10 }, { 'Ace': 11 }],
         'Hearts': [{ '2': 2 }, { '3': 3 }, { '4': 4 }, { '5': 5 },
                    { '6': 6 }, { '7': 7 }, { '8': 8 }, { '9': 9 },
                    { '10': 10 }, { 'Jack': 10 }, { 'Queen': 10 },
                    { 'King': 10 }, { 'Ace': 11 }],
         'Diamonds': [{ '2': 2 }, { '3': 3 }, { '4': 4 }, { '5': 5 },
                      { '6': 6 }, { '7': 7 }, { '8': 8 }, { '9': 9 },
                      { '10': 10 }, { 'Jack': 10 }, { 'Queen': 10 },
                      { 'King': 10 }, { 'Ace': 11 }] }

MAX_PLAYABLE_VALUE = 21
DEALER_LIMIT = 17
HIT = %w(HIT H)
STAY = %w(STAY S)

# =======================================
#  Initialization Methods
# =======================================

def initialize_deck
  system 'clear'
  Marshal.load(Marshal.dump(DECK))
end

# =======================================
#  Display Methods
# =======================================

def prompt(message)
  puts "=> #{message}"
end

def blank_line(num)
  num.times { puts "" }
end

def clear
  system 'clear'
end

def welcome
  puts "            <-<-<->->->     #{MESSAGES['welcome']}     <-<-<->->->"
  blank_line(2)
  prompt("If you would like to learn the rules of the game type 'rules'")
  prompt("Otherwise hit any key to continue")
  rules
end

def hit_any_key_to_continue
  prompt("Hit any key to continue")
  gets.chomp
end

def rules
  choice = gets.chomp.downcase
  if choice == 'rules' || choice == 'r'
    puts MESSAGES['rules']
    sleep 2.5
    blank_line(1)
    hit_any_key_to_continue
  end
  clear
  prompt("The first player to win 5 games takes the match!")
  sleep 1
end

def convert_hand_to_string(hand)
  cards = []
  hand.each do |array|
    cards << "the #{array[0].keys[0]} of #{array[1]}"
  end
  cards
end

def display_player_hand(hand, value)
  string = 'Your hand inludes '
  cards = convert_hand_to_string(hand)
  cards.each do |card|
    string += if card == cards[-1]
                card + '.'
              elsif card == cards[-2]
                card + ' and '
              else
                card + ', '
              end
  end
  prompt(string)
  prompt("Your hand is worth #{value} points.") # hand value
  prompt("YOU BUSTED!") if bust?(value)
  puts ""
end

def format_display_dealer_hand(hand, hide_card, value)
  string = 'The dealers hand inludes '
  cards = convert_hand_to_string(hand)
  variable = "the hole card" if hide_card
  variable = cards[0] if !hide_card
  cards.each do |card|
    string += if card == cards[0]
                variable
              elsif card == cards[-1]
                ' and ' + card + '.'
              else
                ', ' + card
              end
  end
  display_dealer_hand(hand, hide_card, string, value)
end

def display_dealer_hand(_hand, hide_card, string, value)
  prompt(string)
  prompt(MESSAGES['dealer'] + "#{value} points.") if !hide_card
  prompt("The dealer busted!") if bust?(value)
  blank_line(1)
end

def display_winner(winner)
  prompt("You Won!") if winner == "Player"
  prompt("The Dealer Won...") if winner == "Dealer"
  prompt("It was a tie...") if winner == "Tie"
end

def score(player, dealer, draw)
  blank_line(1)
  puts "         Match Score"
  puts '==========================='
  puts " Player | Dealer | Ties "
  puts "========+=================="
  puts "   #{player}    |    #{dealer}  |   #{draw}"
  puts ""
  hit_any_key_to_continue
  clear
end
# =======================================
# Game Choice Methods
# =======================================

def ask_to_deal_card(answer)
  prompt("Would you like to hit or stay?")
  loop do
    answer = gets.chomp.upcase
    break if HIT.include?(answer) || STAY.include?(answer)
    prompt("Please enter a valid answer...")
  end
  answer
end

def deal_card_to_player?(deck, hand, value)
  answer = ''
  loop do
    answer = ask_to_deal_card(answer)
    deal_one_card(deck, hand) if HIT.include?(answer)
    value = hand_value(hand)
    display_player_hand(hand, value)
    chose_to_stay if STAY.include?(answer)
    break if STAY.include?(answer) || bust?(value)
  end
  return value, false
end

def deal_card_to_dealer?(deck, d_hand, d_value, p_value, hide_card)
  loop do
    break if bust?(p_value)
    break if bust?(d_value)
    prompt("The Dealer stays") if d_value >= DEALER_LIMIT &&
                                  !bust?(p_value)
    break if d_value >= DEALER_LIMIT
    deal_one_card(deck, d_hand)
    d_value = hand_value(d_hand)
  end
  format_display_dealer_hand(d_hand, hide_card, d_value)
  d_value
end

def chose_to_stay
  clear
  prompt("You chose to stay...it is now the dealers turn")
  sleep 1.5
end

def play_again?
  valid = ['Y', 'y', 'Yes', 'YES', 'yes']
  prompt("Would you like to play again? Y or N")
  play_again = gets.chomp
  valid.any?(play_again)
end

# =======================================
# Deal Methods
# =======================================

def initial_deal(deck)
  cards = []
  2.times do
    card = select_card(deck)
    cards << card
  end
  return cards, true
end

def select_card(deck)
  card = []
  suite = deck.keys.sample
  deck[suite].each { |element| card << [element] }
  card = card.sample
  deck[suite].delete(card[0])
  card = card[0], suite
end

def deal_one_card(deck, hand)
  card = select_card(deck)
  hand << card
  prompt("The #{card[0].keys[0]} of #{card[1]} was dealt.")
  card
end

# =======================================
# Hand Value Methods
# =======================================

def hand_value(hand)
  value = 0
  hand.each do |card|
    value += card[0].values[0]
  end
  ace_num = ace_count(hand)
  return value if value <= MAX_PLAYABLE_VALUE
  loop do
    if ace_num > 0
      value -= 10
      ace_num -= 1
    end
    break if value <= MAX_PLAYABLE_VALUE || ace_num == 0
  end
  value
end

def ace_count(hand)
  ace = 0
  hand.each do |card|
    ace += 1 if card[0] == { 'Ace': 11 }
  end
  ace
end
# =======================================
# Game Win Methods
# =======================================

def bust?(value)
  return true if value > MAX_PLAYABLE_VALUE # hand value
  false
end

def who_won?(p_hand, d_hand) # hand value
  return "Dealer" if bust?(p_hand)
  return "Player" if bust?(d_hand)
  return "Player" if p_hand > d_hand
  return "Dealer" if d_hand > p_hand
  return "Tie" if d_hand == p_hand
end

def add_win_count(winner, p_win, d_win, draw)
  if winner == "Player"
    p_win += 1
  elsif winner == "Dealer"
    d_win += 1
  else
    draw += 1
  end
  return p_win, d_win, draw
end

# =======================================
# Game Play Methods
# =======================================

def round(current_deck)
  player_hand, hide_card = initial_deal(current_deck)
  dealer_hand, = initial_deal(current_deck)
  player_hand_value = hand_value(player_hand)
  dealer_hand_value = hand_value(dealer_hand)
  format_display_dealer_hand(dealer_hand, hide_card, dealer_hand_value)
  display_player_hand(player_hand, player_hand_value)
  player_hand_value, hide_card = deal_card_to_player?(current_deck,
                                                      player_hand,
                                                      player_hand_value)
  dealer_hand_value = deal_card_to_dealer?(current_deck, dealer_hand,
                                           dealer_hand_value, player_hand_value,
                                           hide_card)
  round_winner = who_won?(player_hand_value, dealer_hand_value)
  display_winner(round_winner)
  round_winner
end

# =======================================
# Game Play
# =======================================

welcome
loop do
  player_win = 0
  dealer_win = 0
  tie = 0
  loop do
    current_deck = initialize_deck
    round_winner = round(current_deck)
    player_win, dealer_win, tie = add_win_count(round_winner,
                                                player_win,
                                                dealer_win,
                                                tie)
    score(player_win, dealer_win, tie)
    if player_win == 5
      clear
      prompt("YOU WON THE MATCH!!!")
      break
    elsif dealer_win == 5
      clear
      prompt("You lost the match...so sad :(")
      break
    end
  end
  break if !play_again?
end
prompt("Thanks for playing")
