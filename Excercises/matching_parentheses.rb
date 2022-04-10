=begin
Matching Parentheses?
PROBLEM:
Write a method that takes a string as an argument, and returns true if all
parentheses in the string are properly balanced, false otherwise. To be properly
balanced, parentheses must occur in matching '(' and ')' pairs.

Examples:
  balanced?('What (is) this?') == true
  balanced?('What is) this?') == false
  balanced?('What (is this?') == false
  balanced?('((What) (is this))?') == true
  balanced?('((What)) (is this))?') == false
  balanced?('Hey!') == true
  balanced?(')Hey!(') == false
  balanced?('What ((is))) up(') == false

Note that balanced pairs must each start with a (, not a ).

EDGE CASES:
  -Not a string


DATA:
  -input string
  -a collection array

ALGORITHM:
  -Split string into chars
  -scan for '('
  -scan for matching ')'
  -scan for additinal '(' or ')'
  -return a boolean if pairs are balanced

=end

#My initial stab at it. Doesn't account for a leading ')', just total parity
def balanced?(string)
  string = string.chars
  left = []
  right = []

  string.each do |char|
    left << char if char == '('
  end

  string.each do |char|
    right << char if char == ')'
  end

  left.size == right.size
end

#Launch School solution
balanced?(string)
  parens = 0
  string.each_char do |char|
    parens +=1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end
