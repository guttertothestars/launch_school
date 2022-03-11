require 'pry'

=begin
  count = 0
  phrase = "The Flintstones Rock!"
  loop do
    until count == 10
      phrase.prepend(' ')
      count += 1
      puts phrase
    end
  end
=end

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

puts "the value of 40 + 2 is " + (40 + 2).to_s

def factors(number)
  divisor = number
  factors = []
  loop do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    break if divisor <= 0
  end
  factors
end

#LS Solution:
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(42)




  def fib(first_num, second_num)
    limit = 15
    while first_num + second_num < limit
      sum = first_num + second_num
      first_num = second_num
      second_num = sum
    end
    sum
  end

  result = fib(0, 1)
  puts "result is #{result}"

  answer = 42

  def mess_with_it(some_number)
    some_number += 8
  end

  new_answer = mess_with_it(answer)

  p answer - 8

  def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)
