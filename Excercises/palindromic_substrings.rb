=begin
Palindromic Substrings
Write a method that returns a list of all substrings of a string that are
palindromic. That is, each substring must consist of the same sequence of
characters forwards as it does backwards. The return value should be arranged
in the same sequence as the substrings appear in the string. Duplicate
palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters
and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba"
nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

Examples:
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
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

def substrings(str)
  results = []

  (0...str.size).each do |starting_index|
    this_substring = str[starting_index..-1]
    results.concat(leading_substrings(this_substring))
  end

  results
end

def palindromes(str)
  palindrome_results = []
  substring_results = substrings(str)

  substring_results.each do |el|
    if el.size == 1
      substring_results.delete(el)
    end
  end

  substring_results.each do |el|
    if el === el.reverse
      palindrome_results << el
    end
  end

  palindrome_results
end
