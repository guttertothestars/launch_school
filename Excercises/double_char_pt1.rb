=begin
Double Char (Part 1)
Write a method that takes a string, and returns a new string in which every
character is doubled.

Examples:
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
=end

def repeater(str)
  str.chars.map{|el| el << el }.join
end
