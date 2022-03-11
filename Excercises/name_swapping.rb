=begin
Name Swapping
Write a method that takes a first name, a space, and a last name passed as a
single String argument, and returns a string that contains the last name, a
comma, a space, and the first name.

Examples:
swap_name('Joe Roberts') == 'Roberts, Joe'

DATA
A string, a collection array

Algorithm: Split on the space, reconstitute w/ a comma
=end

def swap_name(string)
  reversed_name = "#{string.split.last}, #{string.split.first}"
end
