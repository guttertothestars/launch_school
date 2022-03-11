require "pry" # add this to use Pry

#monthly payment ends up = '' and not to the output of the equation.
#Will write secondard calculator following LS solution and look back to see why mine fails

=begin
Mortgage / Car Loan Calculator
You'll need three pieces of information:

  1) the loan amount
  2) the Annual Percentage Rate (APR)
  3)the loan duration

From the above, you'll need to calculate the following things:

  1) monthly interest rate
  2) loan duration in months
  3) monthly payment

  You can use the following formula:
    m = p * (j / (1 - (1 + j)**(-n)))

    m = monthly payment
    p = loan amount
    j = monthly interest rate
    n = loan duration in months
=end

def prompt(message)
      puts("=> #{message}")
end

loop do

  prompt("Welcome to Best Mortgage & Loan Calculator!")
  prompt("-------------------------------------------")

  prompt("Hello! We'll just grab a few bits of info from you now")
  prompt("How much is your total loan amount?")

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp

    if loan_amount.empty?() || loan_amount.to_i < 0
      prompt("please enter a valid, positive number!")
    else
      break
    end
  end

  prompt("What is the interest rate?")
  prompt("(Example: 2.5 for 2.5% or 5 for 5%)")

  rate = ''
  loop do
    rate = Kernel.gets().chomp()

    if rate.empty?() || rate.to_f < 0
      prompt("please enter a valid, positive number!")
    else
      break
    end
  end

  prompt("Thanks. Now, how many years is this loan?")

  loan_duration = ''
  loop do
    loan_duration = Kernel.gets().chomp()

    if loan_duration.empty?() || loan_duration.to_i < 0
      prompt("please enter a valid length")
    else
      break
    end
  end

  annual_rate = rate.to_f / 100
  monthly_rate = annual_rate.to_f / 12
  loan_duration_in_months = loan_duration.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_rate /
                      (1 - (1 + monthly_rate)**(-loan_duration_in_months)))

  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Another calculation?")
    answer = Kernel.gets().chomp()

    break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")
