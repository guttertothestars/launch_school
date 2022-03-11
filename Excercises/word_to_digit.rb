=begin
Word to Digit
Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:

word_to_digit('Please call me at five five five one two three four. Thanks.')
== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Edge cases - capitalized numbers
           -punctuation

DATA:
A hash for number to digit conversion i.e. "One" => 1
An input and output string
Array for iteration

Algorithm:
-Create NUMBERS constant hash
-iterate through hash and compare each key to input string
-replace string elements that match hash keys w/hash values
-return string


=end

NUMBERS = {'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
           'five' => '5', 'six' => '6', 'seven' => '7',  'eight' => '8', 'nine' => '9'}

def word_to_digit(string)
  NUMBERS.each do |k, v|
    string.gsub!(k, v)
  end
  string
end
