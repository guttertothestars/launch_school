#Problem

#Write a method that takes one argument, an array containing integers,
#and returns the average of all numbers in the array. The array will never be
#empty and the numbers will always be positive integers.
#Your result should also be an integer.

  #requirements
    #must be in the form of a method
    #method takes an array as an argument
    #method averages all nums in array
    #method returns an integer

#edge / test cases

#No empty arrays/no negative ints
#puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
#puts average([1, 5, 87, 45, 8, 8]) == 25
#puts average([9, 47, 23, 95, 16, 52]) == 40
#Data Structures
#Integers
#arrays

#algorithm
#loop through the given array
#pop element off array
#add current element to stored sum
#increment counter
#break when array is empty

#alternative algorithm

def average(array)
sum = array.sum
array_average = sum.to_f / array.count #to_f returns a float 
end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40
