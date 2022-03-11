
=begin
Double Char (Part 2)
Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Examples:
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
=end

CONSONANTS = %w( b B c C d D f F g G h H j J k K l L m M n N p P q Q r R s S t
                 T v V w W x X y Y z Z)

def double_consonants(str)
  str.chars.map do |el|
    if CONSONANTS.include?(el)
      el << el
    else
      el
    end
  end.join
end
