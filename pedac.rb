There's a bunch of numbers and another number and we need to see if the
placement of numbers from the bunch of numbers can be added to result
in the other number.

Given an array of integers nums and an integer target, return indices of the
two numbers such that they add up to target

Problem: There is an array of numbers provided, along with a target number.
Determine if any two elements in the array can be added to equal the target number.
  if true, return the indices of those two elements

Expected Input:
  -collection (array) of numbers
  -target number.

Does placement of numbers from the array summed equal the target number?
Expected Output:
  -array of index positions

Examples:
  # p two_sum([2, 11, 7, 15], 9) == [0, 2]
  # p two_sum([3, 2, 4], 6) == [1, 2]
  # p two_sum([3, 3], 6) == [0, 1]

Edge Cases:
  -arrays with non-integer objects, empty arrays,

Data Structures:
  -arrays
  -integers

Algorithm:
High Level:
  -break the given array down to two element arrays such that every possible
  combination of two-element arrays is present.
  -sum each sub array and compare to target number
  -if sum matches target return an array with the index position of the numbers from
  the original array.

Low Level:
-create a collection array for sub-arrays
-loop through original array adding a  sub-array of each element plus the next
 element until all elements are accounted for.
-compare sum of sub-arrays to target integer and save if == target
iterate throuh original array to comapre to correct to element pair, pulling index positions.


def two_sum(arr, target)
  sub_arrays = []
  arr.each_with_index do |elem, idx|  #gives a collection of all two element sub_arrys.
    idx2 = 1
    loop do
      break if idx2 == arr.size
      sub_arrays << [elem, arr[idx2]]
      idx2 += 1
    end
  end

  target_sub_array = []
  sub_arrays.each do |sub_arr|
    if sub_arr.sum == target
      target_sub_array << sub_arr
    end
    target_sub_array.flatten!
  end

  answer = []
  arr.each_with_index do |elem, idx|
    if target_sub_array.include?(elem)
      answer << idx
    end
  end
  answer
end
