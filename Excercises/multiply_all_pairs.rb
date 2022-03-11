=begin
Multiply All Pairs

PROBLEM:
Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of every pair
of numbers that can be formed between the elements of the two Arrays.
The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

EXAMPLES/EDGE CASES:
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

DATA:
Arrays, two input, one collection

ALGORITHM:
*Determine which array is shorter
*Iterate through the shorter array, multiplying each element by all elements in
the longer array and shunting the sum to a collection array

=end
def multiply_all_pairs(arr1, arr2)
  arr3 = []
  if arr1.length <= arr2.length
    arr1.each do |el1|
      arr2.each do |el2|
        arr3 << el1 * el2
      end
    end
  else
    arr2.each do |el2|
      arr1.each do |el1|
        arr3 << el2 * el1
      end
    end
end
  arr3.sort
end
