WINNING_MOVES = {
  'rock': ['scissors', 'lizard'],
  'paper': ['rock', 'spock'],
  'scissors': ['paper', 'lizard'],
  'spock': ['scissors', 'rock'],
  'lizard': ['spock', 'paper']
}

VALID_CHOICES = WINNING_MOVES.keys
VALID_ABBREVIATIONS = %w(r p sc l sp)

def prompt(message)
  puts "=> #{message}"
end

def expand_abbreviation(abbreviation)
  case abbreviation
  when 'r' then :rock
  when 'p' then :paper
  when 'sc' then :scissors
  when 'l' then :lizard
  when 'sp' then :spock
  end
end

def win(choice, computer_choice)
  WINNING_MOVES[choice.to_sym].include?(computer_choice.to_s)
end

def display_winner(player, computer)
  if win(player, computer)
    prompt("Player wins!")
  elsif win(computer, player)
    prompt("Computer wins!")
  else
    prompt("Tie game")
  end
end

system "clear"

puts <<-MSG
=> Hello! Welcome to Squid Game! I mean, Rock Paper Scissors Lizard Spock!

=> It's a thing, apparently


=> RULES:
=> ROCK beats Scissors and Lizard.
=> PAPER beats Rock and Spock.
=> SCISSORS beats Paper and Lizard.
=> SPOCK beats Rock and Scissors.
=> LIZARD beats Paper and Spock.


=> Best out of three is the 'Grand Winner'"

MSG

player_score = 0
computer_score = 0

loop do # main loop
  loop do # game loop
    choice = ''
    loop do # choice loop
      prompt("Please choose one: (R)ock, (P)aper, (Sc)issors, (Sp)ock")
      choice = gets().chomp().downcase

      if VALID_CHOICES.include?(choice.to_sym)
        break
      elsif VALID_ABBREVIATIONS.include?(choice)
        choice = expand_abbreviation(choice)
        break
      elsif choice.empty?
        puts "No choice, huh?"
        puts "I too have heard it said that the only way to win is not to play"\
        " the game."
        puts "Sadly, for you, this is not the case."
        computer_score = 3
        prompt("#{player_score} vs #{computer_score}")
        prompt("Flawless Victory")
        prompt("Computer wins. Humanity weeps.")
        sleep(2)
        exit(true)
      else
        prompt("#{choice} is not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample()

    puts "\n=> You chose #{choice.capitalize}, the computer chose "\
    "#{computer_choice.capitalize}.\n"

    display_winner(choice, computer_choice)

    if win(choice, computer_choice)
      player_score += 1
    elsif win(computer_choice, choice)
      computer_score += 1
    end

    prompt("#{player_score} vs #{computer_score}")

    if player_score == 3
      prompt("You win! Grand Winner!")
      break
    elsif computer_score == 3
      prompt("Computer wins. Humanity weeps.")
      break
    end
  end

  prompt("Would you like to play again? 'Y' to continue")
  play_again = gets().chomp()
  break unless play_again.downcase == 'y'
  system "clear"
end
