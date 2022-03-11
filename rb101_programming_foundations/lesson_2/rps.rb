VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
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

prompt("Hello! Welcome to Squid Game! I mean, Rock, Paper Scissors!")

loop do # main loop
  choice = ''
  loop do
    prompt("Please choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("#{choice} is not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts("You chose #{choice}, the computer chose #{computer_choice}.")

  display_winner(choice, computer_choice)

  prompt("Would you like to play again? 'Y' to continue")
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase == 'y'
end
