def substrings(string) # helper method
  substring_array = []
  starting_index = 0

  while starting_index <= (string.length - 2) # outer loop
    num_chars = 2
    while num_chars <= string.length - starting_index # inner loop
      substring = string.slice(starting_index, num_chars)
      substring_array << substring
      num_chars += 1
    end # end inner loop
    starting_index += 1
  end # end outer loop
  substring_array
end

def is_palindrome?(string) # helper method
  string == string.reverse
end

def palindrome_substrings(string) # main method
  result = []
  substring_array = substrings(string) # passes the string to substrings method, returns an array of all the substrings
  substring_array.each do |substring| # iterates through substring_array, passing each element to the is_palindrome? method
    result << substring if is_palindrome?(substring) # if true it appends the palindrome to the result array
  end
  result # finally it returns the results array with all the palindromes
end

p palindrome_substrings("radar")
