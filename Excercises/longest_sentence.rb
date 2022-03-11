=begin
Longest Sentence
Write a program that reads the content of a text file and then prints the longest
sentence in the file based on number of words. Sentences may end with periods
(.), exclamation points (!), or question marks (?). Any sequence of characters t
hat are not spaces or sentence-ending characters should be treated as a word.
You should also print the number of words in the longest sentence.

Example text: Mary Shelley's Frankenstein.

Data: -an external text File.read("path/to/file")
      -an array to contain all the sentences
      -a string object pointing at the longest sentence

algorithm
  -initalize a local variable and point it at an external text File
  -initalize an array (sentences) and split text file into array elements that
   are one sentence long
   -remove newline characters from each sentence
  -intialize a local variable (longest_sentence) and point it at an empty
   string object
  -iterate of sentences array comparing current string to longest string and
   replacing longest string w/current string if current string is greater
   -print out longest sting
   -print number of words in longest sentence
=end

def longest_sentence_in_text()
  puts "Please choose a text file: "
  user_choice = gets.chomp

  file = File.open(user_choice)
  file_data = file.read

  sentences = file_data.split(/(?<=[.\!\?])/) # Splits text into individual sentences
  # ? < = 'looks back' and includes the delimeter in the array element

  longest_sentence = ""

  sentences.each do |sentence|
    if sentence.split.length > longest_sentence.split.length
      longest_sentence = sentence
    end
  end
  puts longest_sentence
  puts "The longest sentence contains #{longest_sentence.split.length} words"
end

def longest_word_in_text()
  puts "Please choose a text file: "
  user_choice = gets.chomp

  file = File.open(user_choice)
  file_data = file.read

  words = file_data.split

  longest_word = ""

  words.each do |word|
    if word.length > longest_word.length
      longest_word = word
    end
  end

  puts "The longest word is #{longest_word}"
end

longest_sentence_in_text()
longest_word_in_text()
