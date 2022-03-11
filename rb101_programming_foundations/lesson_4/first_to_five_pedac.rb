#Problem
#The following code increments number_a and number_b by either 0 or 1.
#loop is used so that the variables can be incremented more than once,
#however, break stops the loop after the first iteration. Use next to modify
#the code so that the loop iterates until either number_a or number_b equals 5.
#Print "5 was reached!" before breaking out of the loop

#Explicit reqs
#Use next
#Either number_a or number_b must equal 5
#Print message must come before breaking the looping

#Impolicit reqs
#this one is pretty much on rails


#Edge/Test cases
#None, base code is provided so break conditions will always be met if break
#is configured appropriately

#Data Structures
#variables
#Integers

#Algorithims
#Increment two numbers with a loop
#increment each number 0 or 1 using sample
#check if number_a == 5 using next
#print message and break if true
#check if number_b == 5 using next
#print message and break if true
#loop until true

#Code



number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next if number_a != 5 &&   number_b != 5

  if number_a == 5 or number_b == 5
    puts "5 was reached"
  end

  break if number_a == 5 || number_b == 5
end
