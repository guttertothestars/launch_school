=begin
Delete vowels
Write a method that takes an array of strings, and returns an array of the
same string values, except with the vowels (a, e, i, o, u) removed.

Example:

remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=end

def remove_vowels(arr)
  arr.map!(&:chars)
  arr.each do |sub_arr|
    sub_arr.delete_if { |el| VOWELS.include?(el) }
  end
  arr.map(&:join)
end

#LAUNCHSCHOOL SOLUTION:
def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end
