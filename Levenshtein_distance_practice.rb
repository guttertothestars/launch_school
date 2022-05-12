require 'text'

inventory = ["flour", "sugar", "butter", "eggs"]

puts "What are you looking for?"

choice = gets.chomp

inventory.each do |item|
  if Text::Levenshtein.distance(item, choice) <= 2
    puts "Did you mean #{item}?"
    puts "Please double check the spelling."
  end
end
