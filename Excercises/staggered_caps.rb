=begin
Staggered Caps (Part 1)
Write a method that takes a String as an argument, and returns a new String that
contains the original value using a staggered capitalization scheme in which
every other character is capitalized, and the remaining characters are lowercase.
Characters that are not letters should not be changed, but count as characters
when switching between upper and lowercase.

Example:
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
=end


def staggered_case(string)
  result = ''
  needs_upper = true #boolean toggle

  string.chars.each do |char|
    if needs_upper
      result += char.upcase
    else
      result += char.donwcase
    end
    needs_upper = !needs_upper #toggles between caps and non-caps
  end
  result
end





=begin
This was my original code. It mostly did the needed, but started each word fresh,
not every other charachter regardles of word-separation.

def staggered_case(string)
  string = string.split

  string.map! do |word|
   word.chars
 end

 string.each do |sub_arr|
   sub_arr.each_with_index do |letter, index|
     index.even? ? letter.upcase! : letter.downcase
   end
 end

 string.map do |word|
   word.join
 end.join(' ')
end

=end
