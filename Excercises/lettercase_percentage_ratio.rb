=begin
Lettercase Percentage Ratio
In the easy exercises, we worked on a problem where we had to count the number
of uppercase and lowercase characters, as well as characters that were neither
of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the percentage of characters in the string that are
lowercase letters, one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples:

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

Edge cases:
Non-strings

Data:
Strings, arrays, hashes

Algorithm:
create two helper methods to check upcase and downcase

-Convert string argument into char array
-Create a collection hash with 3 keys: upper, lower, neither
-iterate through char array
  -check if current char is upcase, downcase, or neither
  -increment the hash appropriately
  -check if every char has been interated over
convert and output each hash key/value pair as a percentage
  -sum all hash values
  -compare key[value] to sum of all values
  -determine percentage
  -update hash to represent percentage
  Output hash
=end

def is_upcase?(char)
  char == char.upcase
end

def is_downcase?(char)
  char == char.downcase
end

def letter_percentages(string)
  letters_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  string_array = string.chars

  string_array.each do |char|
    if is_downcase?(char)
      letters_hash[:downcase] += 1
    elsif is_upcase?(char)
      letters_hash[:upcase] += 1
    else
      letters_hash[:neither] += 1
    end
  end

  puts letters_hash
end
