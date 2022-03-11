=begin
Sequence Count
Create a method that takes two integers as arguments. The first argument is a
count, and the second is the first number of a sequence that your method will
create. The method should return an Array that contains the same number of
elements as the count argument, while the values of each element will be
multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater,
while the starting number can be any integer value. If the count is 0, an empty
list should be returned.

Examples:
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

Data:
integers, arrays, sequential ints.

Algorithm:
Starting with the first sequental number append the sequental sum to a
collection array x number of times, x being both the number of elements the
finished array will contain and the multiple by which array elements are to be
summed.

x times collection_array(starting with y) << y += y + y

=end

 def sequence (count_num, primary_num)
   result = [primary_num]
   (count_num - 1).times do
     result << result[-1] + primary_num
   end

   if count_num == 0
     result = []
   else
   result
  end
 end 
