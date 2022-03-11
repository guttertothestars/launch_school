=begin
The End Is Near But Not Here
PROBLEM:
Write a method that returns the next to last word in the String passed to it as
an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

EXAMPLES/EDGE CASES:

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

DATA:
input and output are strings
I suspect I'll use an array

=end

def penultimate(str)
  str_arr = str.split
  str_arr[-2]
end

# FURTHER EXPLORATION

def middling_ultimate(str)
  if str == ''
    "There are no words"
  else if str.length == 1
         return str
       else
         str_arr = str.split
  end

       middle = (str_arr.length.to_f / 2).round
       str_arr[middle]
end
end
