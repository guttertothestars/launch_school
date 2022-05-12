=begin
Sum Square - Square Sum
Write a method that computes the difference between the square of the sum of the
first n positive integers and the sum of the squares of the first n positive integers.

Examples:
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

=end

def sum_square_difference(num)

   nums = (1..num).to_a
  sum_square = (1..num).inject(:+)**2 - \ # \ to break line for length and clarity
  square_sum = (1..num).to_a.map { |el| el * el }.sum

end
