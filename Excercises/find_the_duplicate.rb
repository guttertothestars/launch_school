=begin
Find the Duplicate
Given an unordered array and the information that exactly one value in the array
occurs twice (every other value occurs exactly once), how would you determine
which value occurs twice? Write a method that will find and return the duplicate
value that is known to be in the array.

Examples:

find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

=end

def find_dup(array)
  array.select {|element| array.count(element) > 1 }.uniq[0] #uniq not needed
end

#better solution from classmate: doesn't require iterating through every single element
#this is only true because we know there is a single duplicate value
def find_dup(arr)
  arr.each { |element| return element if arr.count(element) > 1 }
end
