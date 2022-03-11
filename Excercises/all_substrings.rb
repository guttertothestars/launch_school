=begin
All Substrings
Write a method that returns a list of all substrings of a string. The returned
list should be ordered by where in the string the substring begins. This means
that all substrings that start at position 0 should come first, then all
substrings that start at position 1, and so on. Since multiple substrings will
occur at each position, the substrings at a given position should be returned in
order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in
the previous exercise:

Examples:
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

=end

def leading_substrings(str)
  counter = 0
  str_arr = []

  str.length.times do
    str_arr << str.slice(0..counter)
    counter += 1
  end
  str_arr
end

def substrings(string)
  results = []

  (0...string.size).each do |starting_index|
    this_substring = string[starting_index..-1]
    results.concat(leading_substrings(this_substring))
  end

  results
end
