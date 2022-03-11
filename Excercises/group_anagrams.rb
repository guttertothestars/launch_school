=begin
Group Anagrams
Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams. Anagrams are
words that have the same exact letters in them but in a different order. Your
output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)

will need to sort and compare, reference original index, create a new array

I'm thinking of a hash with the original (sorted) word as the key, and then
values = array of all the words that match it inserted by index position in the
original words array

loop with counter being the index number for the creation of a new array?

words.each_with_index do |word, index|
 words[index] = [word, index]
end  <-- This worked well.

I got a long way with words.chars.sort.join but not where I needed to go. I was
on the right track with the hash, but off-track with needing to reference the
original array by index.
=end

#Launch School Solution

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

result = {} #collection hash

words.each do |word|
  key = word.split('').sort.join

  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |value|
  p "------"
  p value
end
