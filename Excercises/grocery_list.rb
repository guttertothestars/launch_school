=begin
Grocery List
Write a method which takes a grocery list (array) of fruits with quantities
and converts it into an array of the correct number of each fruit.

Example:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

Data: Arrays
I'm assuming I can't return a new array here, so...

Algorithm:
copy first element of sub-array until there are second-element of sub-array
numbers of it. Do this for each sub-array.
Flatten the array.
=end

def buy_fruit(list)
  list.each do |sub_array|
    sub_array.last.times do
      sub_array << sub_array.first
    end
  end # Gets the right number of repeated items into each sub-array

  list.each do |sub_array|
    sub_array.delete_at(0)
    sub_array.delete_at(0)
  end # Removes the integers and extraneus fruit
  list.flatten # Removes the sub arrays and returns the single, orginal array
end
