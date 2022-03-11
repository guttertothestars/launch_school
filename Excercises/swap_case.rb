=begin
Swap Case
Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

Example:
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

=end

def upcase?(char)
  return true if char == char.upcase
end

def swapcase(str)
  str = str.chars
  str.map! do |letter|
    if upcase?(letter)
      letter.downcase
    else
      letter.upcase
    end
  end
  str.join
end
