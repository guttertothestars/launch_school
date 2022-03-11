# RB101 Lesson 2 Calculator walkthrough

# Ask the user for two numbers
# Ask the user for an operation to be performed
# Perform the operation on the two numbers
# Return the result

#Concerns:
#addition, multiplication, and subtraction can't handle floats

def prompt(message)
  Kernel.puts("=> #{message}")
end

#def valid_number(num)
#  num.to_i != 0
#end

  def integer?(input)
    input.to_i.to_s == input
  end

  def float?(input)
    input.to_f.to_s == input
  end

  def number?(input)
    integer?(input) || float?(input)
  end

def operation_to_message(operator)
  case operator
  when '1'
    "Adding"
  when '2'
    "Subtracting"
  when '3'
    "Multiplying"
  when '4'
    "Dividing"
  end
end

prompt("Wilkomen a la Calculator Please enter your name: ")

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name!")
  else
    break
  end
end

prompt("Hello #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What is the first number?")
    number1 = Kernel.gets().chomp()

    if number?(number1)
      break
    else
      prompt("Not a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What is the second number?")
    number2 = Kernel.gets().chomp()

    if number?(number2)
      break
    else
      prompt("Not a valid number")
    end
  end

  operator_prompt = <<-MSG
    What Operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG
  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, 4!")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  prompt("The result is: #{result}")
  prompt("Would you like to perform another calculation? Y to caluclate again.")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using the calculator. Goodbye.")
