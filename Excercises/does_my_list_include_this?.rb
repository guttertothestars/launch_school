=begin
Does My List Include This?
Write a method named include? that takes an Array and a search value as
arguments. This method should return true if the search value is in the array,
false if it is not. You may not use the Array#include? method in your solution.

Examples:

  include?([1,2,3,4,5], 3) == true
  include?([1,2,3,4,5], 6) == false
  include?([], 3) == false
  include?([nil], nil) == true
  include?([], nil) == false

=end

def include?(arr, search_value)
  counter = 0
  loop do
    if arr[counter] == search_value
      return true
    else if arr[counter] != search_value
           counter += 1
    end
         return false if counter == arr.length - 1
  end
  end
end

#better solution, albeit terneray

def include?(arr, search_val)
  arr.count(search_val) == 0 ? false : true
end
