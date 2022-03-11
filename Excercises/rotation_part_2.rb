=begin
Rotation (Part 2)
Write a method that can rotate the last n digits of a number.

For example:
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

=end

def rotate_array(array)
  array[1..-1] + [array[0]] #needs to be taken as an array to avoid type-conversion error
end

def rotate_rightmost_digits(number, remainder)
  array = number.digits.reverse #takes number and converts to an array
  bulk = array[0, (array.size - remainder)] #initializes an array object whose elements are the portion of the original number that is not being rotated
  tail_end = array.reverse[0, remainder].reverse #initializes an array object whose elements are the portion of the original number that is being rotated
  (bulk + rotate_array(tail_end)).map {|digit| digit.to_s}.join.to_i # returns the concatenation of both arrays to return array object with the expected portion rotated
end

#Does not mutate original number

#LaunchSchool solution:
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end
