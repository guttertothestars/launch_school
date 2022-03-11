#non-mutative version
=begin

def double_numbers(numbers)
  doubled_numbers = [] #sets an array to store the doubled numbers
  counter = 0 #sets a counter for iteration

  loop do
    break if counter == numbers.size

    current_number = numbers[counter] #sets current number to the index of numbers array, as determined by current counter number
    doubled_numbers << current_number * 2 #doubles current number and appends it to doubled_numbers array

    counter += 1 #must have a counter to break out of loop and to ensure every element is targeted
  end #ends loop

  doubled_numbers #returns doubled_numbers
end #ends method

=end


#mutative version
=begin
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end #ends loop

  numbers
end
=end




#modify double_numbers method to allow it to multiply by any given numbers
def multiply(numbers, multiplier)
  multiplied_numbers = [] #sets an array to store the multiplied numbers
  counter = 0 #sets a counter for iteration

  loop do
    break if counter == numbers.size


    multiplied_numbers << numbers[counter] * multiplier #multiplies current number and appends it to multiplied_numbers array

    counter += 1 #must have a counter to break out of loop and to ensure every element is targeted
  end #ends loop

  multiplied_numbers #returns multiply
end #ends method

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3)
