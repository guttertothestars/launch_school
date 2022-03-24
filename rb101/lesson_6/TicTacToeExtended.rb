#look for places to slot in ternary operators

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

def place_piece!(board, current_player) #This could be improved. Maybe a ternary
  if current_player == "human"
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
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

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil

  # attack first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # Defense bb
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
end

  if brd[5] == INITIAL_MARKER
    square = 5
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def alternate_player!(current_player) #This could be improved. Maybe a ternary
  loop do
    if current_player == "human"
      current_player.replace('computer')
      break
    end
    if current_player == 'computer'
      current_player.replace('human')
      break
    end
  end
  current_player
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

# Game Program Below
scores = { "Player" => 0, "Computer" => 0 }
current_player = 'human' # initialize current player so it is in all scopes

loop do # Main game loop
  loop do # loop determines who goes first
    prompt("Would you like to go first? Y/N")
    go_first = gets.chomp
    if go_first.downcase.start_with?('y')
      current_player = 'human'
      break
    elsif go_first.downcase.start_with?('n')
      current_player = 'computer'
      break
    else
      prompt("That's not a valid answer")
    end
  end

  board = initialize_board
  initialize_board
  display_board(board)

  loop do
    display_board(board)
    place_piece!(board, current_player) # need to write this method
    current_player = alternate_player!(current_player) # and also this method
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
  prompt "Current score is: Player #{scores['Player']} & Computer #{scores['Computer']}"

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
