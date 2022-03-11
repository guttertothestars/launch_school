=begin
Now I Know My ABCs
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do
not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be
spelled from this set of blocks, false otherwise.

Will need a way to interate through a collection of blocks, checking first one
value, then another against a word.

Examples:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

Data: Strings, probably a hash for the blocks, an array for string characters

Algorithm:
  -create a hash for block values
  create a collection string
  -convert block_word? argument to uppercase
  -create a counter object
  -loop
    compare word at index[count] to keys and values of blocks Hash
    if a match is made append word at index[count] to collection string &
    delete key/value pair from blocks hash
    break loop when every letter in original string has been compared against
    the available block pairs
    compare equality between collection string and orginal string

=end

def block_word?(word)
  available_blocks = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A',
                       'G' => 'T',   'R' => 'E',   'F' => 'S', 'J' => 'W', 'H' => 'U',
                       'V' => 'I',   'L' => 'Y',   'Z' => 'M' }
  word.upcase!
  test_word = ''

  count = 0
  loop do
    if available_blocks.keys.include?(word[count])
      test_word << word[count]
      available_blocks.delete(word[count])
    end
    if available_blocks.values.include?(word[count])
      test_word << word[count]
      available_blocks.delete_if {|key, value| value == (word[count])}
    end
    count += 1
    break if count == word.length
  end
  test_word == word
end
