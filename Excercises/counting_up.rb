=begin
Counting Up
Write a method that takes an integer argument, and returns an Array of all
integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater
than 0.

Examples:
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

DATA:
Integers, Arrays,

Algorithm
Create a collection array and add an array element to it starting at 1 and
incrementing by 1 up to a specified number.

=end

def sequence(num)
  results = []
  counter = 1

  loop do
    break if counter > num
      results.push(counter)
      counter += 1
    end
  results
end

#Launch School Solution

def sequence(number)
  number > 0 ? (1..number).to_a : (number..-1).to_a
end
