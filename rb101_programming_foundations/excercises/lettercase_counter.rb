=begin
Lettercase Counter
Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the number of characters in the string that are
lowercase letters, one the number of characters that are uppercase letters,
and one the number of characters that are neither.

Examples
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

DATA:
input date is a string
output data is a hash w/ three entries

algorithm:
  compare string to regex of all lowercase letters and get count.
  compare string to regex of all uppercase letters and get count.
  get string length count and subtract the previous two counts from it to get
  other chars count

=end

def letter_case_count(str)
  letters_count = Hash.new

  letters_count[:lowercase] = str.scan(/[a-z]/).count
  letters_count[:uppercase] = str.scan(/[A-Z]/).count
  letters_count[:neither] = str.scan(/[^a-zA-Z]/).count

  letters_count
end
