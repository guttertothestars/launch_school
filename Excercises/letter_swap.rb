=begin
Letter Swap
Given a string of words separated by spaces, write a method that takes this
string of words and returns a string in which the first and last letters of
every word are swapped.

You may assume that every word contains at least one letter, and that the string
will always contain at least one word. You may also assume that each string
contains nothing but words and spaces

Examples:
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
=end

def swap(string)
  string = string.split.map do |word|
    word.chars
  end

  counter = 0

  loop do
    break if counter == string.length
    last_letter = string[counter].pop
    first_letter = string[counter].shift
    string[counter].append(first_letter)
    string[counter].prepend(last_letter)
    counter += 1
  end
string.map! {|word| word.join }
string.join(' ')
end

swap("get in losers")
