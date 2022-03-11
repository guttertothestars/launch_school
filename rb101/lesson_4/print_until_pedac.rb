# Given the array of several numbers below, use an until loop to print each number.

#numbers = [7, 9, 13, 25, 18]

#Problem

#Explicit Reqs
#Use an until loop
#print each number in the array

#edge/test cases

#7
#9
#13
#25
#18

#data Structures
#arrays and Integers

#Algorithm
#select first element of array
#remove from element
#print element
#repeat 1-3 until array is empty

#Code
numbers = [7, 9, 13, 25, 18]

puts numbers.shift until numbers.empty?
