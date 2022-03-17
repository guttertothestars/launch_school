


require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diaganols

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end
x
def display_board(brd)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}. The Computer is an #{COMPUTER_MARKER}"
  puts "Best out of 3 rounds wins"
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end

# we want a hash for kv pairs of board position & piece played. It's repetitive
# af to type all that out so a helper method is used.

def initialize_board
  new_board = {}
  (1..9).each do |num|
    new_board[num] = INITIAL_MARKER
  end
  new_board
end

def empty_squares(brd) # inspects but does not mutate, creates an array of board
  # hash values that are == ' ', or available for play
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd) # mutates
  square = '' # initializing outside the loop so it remains accessible
  loop do
    prompt "Choose a square, #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd) #mutates
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # !! forces a bolean onto the return value.
  # By convention, methods ending in a question mark return true booleans
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      # (*line is syntactical sugar for (line[0], line[1], line[2])
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

# Program Below
scores = {"Player" => 0, "Computer" => 0}
loop do # Main game loop
  board = initialize_board

  initialize_board
  display_board(board)

  loop do # game round loop
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt("#{detect_winner(board)} won!")
  else
    prompt("It's a tie.")
  end

  if detect_winner(board) == "Player"
    scores["Player"] += 1
  elsif detect_winner(board) == "Computer"
    scores["Computer"] += 1
  end
  prompt "Current score is: Player #{scores["Player"]} & Computer #{scores["Computer"]}"

  if scores["Player"] == 3
    prompt("Player wins it all")
    break
  elsif scores["Computer"] == 3
    prompt("Computer wins it all")
    break
  end

  prompt("Play again? (Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end # main game loop

prompt("Thanks for playing Tic Tac Toe. Goodbye.")
