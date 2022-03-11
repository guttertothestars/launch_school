=begin
Halvsies
Write a method that takes an Array as an argument, and returns two Arrays
(as a pair of nested Arrays) that contain the first half and second half of
the original Array, respectively. If the original array contains an odd number
of elements, the middle element should be placed in the first half Array.

Examples:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

=end

def halvsies(arr)
  if arr.length == 1
    [[arr[0]], []]
  else if arr.empty?
         return [[], []]
  end

       sa1 = arr.length / 2.0
       sa2 = arr.length / 2.0

       if sa1 % sa1.to_i != 0
         sa1 = sa1.ceil
         sa2 = sa2.floor
       end
       split_arr = [[], []]
       sa1.to_i.times do
         split_arr[0] << arr.shift
       end
       sa2.to_i.times do
         split_arr[1] << arr.shift
       end
       split_arr
end
end

#LAUNCH SCHOOL SOLUTION:
def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end
