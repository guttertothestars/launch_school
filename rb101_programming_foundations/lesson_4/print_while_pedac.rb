##Using a while loop, print 5 random numbers between 0 and 99.

##Problem
# Explicit Requirements
# => Use a while loop
# => Print 5 numbers
# => -numbers must be 'random'
# => -numbers must be between 0 and 99

#Implicit Requirements
# => generate random numbers
# => undertand range method for integers

#Edge Cases/Examples
#None I can think of, although that is probably a failure of imaginiation

#example Output:
#62
#96
#31
#16
#36

#Data Structures
#Integers
#Array to hold integers

#algorithm

#Initialize an empty array
#generate a random number between 0 and 99
#save random number to array
#repeat until array length == 5 /While looping
#print array

#Code
random_nums = []


while random_nums.length != 5
  random_nums << rand(100)
end

puts random_nums
