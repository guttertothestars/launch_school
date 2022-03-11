=begin
Uppercase Check
Write a method that takes a string argument, and returns true if all of the
alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.

Examples:
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

=end

#made a helper method
def is_upcase?(char)
  char == char.upcase
end

def uppercase?(string)
  string.gsub!(/[^a-z]/i, '')
  string = string.chars
  string.all? { |element| is_upcase?(element) }
end

#LaunchSchool Solution:
def uppercase?(string)
  string == string.upcase
end
