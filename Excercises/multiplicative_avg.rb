=begin
Multiplicative Average

PROBLEM:
Write a method that takes an Array of integers as input, multiplies all the
numbers together, divides the result by the number of entries in the Array,
and then prints the result rounded to 3 decimal places.
Assume the array is non-empty.

EXAMPLES/EDGE CASES:

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

DATA:
initial Array
sum collection integers
return string
formatted result integer

ALGORITHM
iterate through array, summing array elements and dividing total sum by
lenght of Array, as a float, rounded to the third decimal places

output that result within a string
=end


def show_multiplicative_average(arr)
  sum = 0
  arr.each do |num|
    if sum == 0
      sum = num
    else
      sum = sum * num
    end
  end

  result = (sum.to_f / arr.length).round(3)

  puts "result is #{sprintf("%.3f", result}"

end
