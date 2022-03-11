=begin
Fizzbuzz
Write a method that takes two arguments: the first is the starting number, and
the second is the ending number. Print out all numbers between the two numbers,
except if a number is divisible by 3, print "Fizz", if a number is divisible
by 5, print "Buzz", and finally if a number is divisible by 3 and 5,
print "FizzBuzz".

Example:
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz,
                11, Fizz, 13, 14, FizzBuzz
=end

def fizzbuzz(num1, num2)
results = []

  (num1..num2).each do |num|
    case
    when (num % 5 == 0 and num % 3 == 0)
      results << "FizzBuzz"
    when num % 5 == 0
      results << "Buzz"
    when num % 3 == 0
      results << "Fizz"
    else
      results << num
    end
  end
  p results.join(', ')
end


fizzbuzz(1, 15)
