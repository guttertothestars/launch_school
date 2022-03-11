=begin
Fibonacci Numbers (Recursion)
The Fibonacci series is a sequence of numbers starting with 1 and 1 where
each number is the sum of the two previous numbers: the 3rd Fibonacci number is
1 + 1 = 2, the 4th is 1 + 2 = 3, the 5th is 2 + 3 = 5, and so on.
In mathematical terms:
  F(1) = 1
  F(2) = 1
  F(n) = F(n - 1) + F(n - 2) where n > 2

Sequences like this translate naturally as "recursive" methods. A recursive
method is one in which the method calls itself.
For example:
  def sum(n)
    return 1 if n == 1
    n + sum(n - 1)
  end

sum is a recursive method that computes the sum of all integers between 1 and n.
Recursive methods have three primary qualities:

They call themselves at least once.
They have a condition that stops the recursion (n == 1 above).
They use the result returned by themselves.
In the code above, sum calls itself once; it uses a condition of n == 1 to
stop recursing; and, n + sum(n - 1) uses the return value of the recursive
call to compute a new return value.
Write a recursive method that computes the nth Fibonacci number, where nth is
an argument to the method.

Data: integers and an array to store them

Algorithm:
  Not gonna lie, I struggled really hard with this one. I took the algorithm from
  the recommmended forum discussion and then worked through it on paper until I
  started to wrap my head around how it works. I do not have the capacity to
  write and algorithm that would have led me to this code at this point in time
  (3/2/22022) See fibonacci_number_by_length.rb to see how I would achieve Fib.

=end

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end
