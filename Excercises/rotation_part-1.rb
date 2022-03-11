=begin
Rotation (Part 1)
Write a method that rotates an array by moving the first element to the end of
the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

=end

#My solution:
def rotate_array(array)
 clone = array.dup
 temp_storage = clone.shift
 clone << temp_storage
end

#Launchschool solution
def rotate_array(array)
  array[1..-1] + [array[0]] #needs to be taken as an array to avoid type-conversion error
end
#Further Exploration

def rotate_string(string)
 clone = string.chars.dup
 temp_storage = clone.shift
 clone << temp_storage
 clone.join
end

def rotate_integers(integers) #struggles with leading zeroes
 clone = integers.digits.reverse.dup
 temp_storage = clone.shift
 clone << temp_storage
 clone.map {|digit| digit.to_s}
 clone.join.to_i
end

def rotate_integers(integers)
  array = integers.digits.reverse
  (array[1..-1] + [array[0]]).map {|digit| digit.to_s}.join.to_i
end #also struggles with leading zeroes
