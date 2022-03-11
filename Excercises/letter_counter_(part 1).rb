=begin
Letter Counter (Part 1)
Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Examples:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

=end

def word_sizes(string)
  # taking string and making it into useful data, setting up collection hash
  word_count = Hash.new
  string = string.split
  string.map!(&:length)

  string.each do |el|
    if word_count.key?(el)
      word_count[el] += 1
    else
      word_count[el] = 1
    end
  end
  word_count
end
