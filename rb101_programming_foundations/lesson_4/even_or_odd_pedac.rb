# Problem
# Write a loop that prints numbers 1-5 and whether the number is even or odd.

# Explicit Reqs
# => -Use a loop
# => -Print integers 1-5
# => -Print if integer is even or odd

# Impicit Reqs
# need a method to determine of integer is even or odd

# edge/test cases

# 1 is odd!
# 2 is even!
# 3 is odd!
# 4 is even!
# 5 is odd!

# Data structures
# strings
# integers

# algorithm
# loop 5 times
# take an integer and determine if it is odd or even
# print the integer and if it is odd or even
# determine if loop hits break reqs

# Code

count = 1

loop do
  if count.odd?
    puts "#{count} is odd!"
  else
    puts "#{count} is even!"
  end

  count += 1
  break if count > 5
end

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end
