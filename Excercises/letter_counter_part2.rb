=begin
Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.

Examples:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

=end

def cleanup(text)
  text.gsub(/[^a-z]/, '')
end

def word_sizes(string)
  # taking string and making it into useful data, setting up collection hash
  string.downcase!

  word_count = Hash.new
  string = string.split

  string.map! do |word|
    cleanup(word)
  end

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
