=begin
Leading Substrings
Write a method that returns a list of all substrings of a string that start at
the beginning of the original string. The return value should be arranged in
order from shortest to longest substring.

Examples:
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
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
