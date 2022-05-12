=begin
Reversed Arrays (Part 2)
Write a method that takes an Array, and returns a new Array with the elements of
the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you
wrote in the previous exercise.

Examples:

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

=end

def reverse(array)
  cloned_array = array.clone
  reversed_array = []
  loop do
    break if cloned_array.empty?
    reversed_array << cloned_array.pop
  end

  reversed_array
end
