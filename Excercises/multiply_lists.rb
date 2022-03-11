=begin
Multiply Lists

PROBLEM:
Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of each pair
of numbers from the arguments that have the same index. You may assume that the
arguments contain the same number of elements.

EXAMPLES/EDGE CASES:
No edge cases per probrem constraints. Possible edge cases are arrays of varying
lengths, or array with non-numeric input.

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

DATA:
arrays

ALGORITHM:
iterate through the arrays using a simple loop, summing the two elements in each
array and collect the sum in a third array.

=end

def multiply_list(arr1, arr2)
  counter = 0
  arr3 = []

  loop do
    break if counter == arr1.length
    arr3 << arr1[counter] * arr2[counter]
    counter += 1
  end
  arr3.sort
end
