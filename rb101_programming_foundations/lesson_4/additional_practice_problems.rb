#Turn this array into a hash where the names are the keys and the values are the positions in the array.


#My solution: returns a hash with reqs met
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.each_with_object({}) do |element, hash|
  hash[element] = flintstones.index(element)
end

#Launch School solution

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end

#Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

#my solution
def sums_ages(hash)
  hash_values = hash.values
  hash_values.sum
end

# puts sums_ages(ages)

#launch School solution
total_ages = 0
ages.each { |_,age| total_ages += age } # _ is used for the key in this hash because we don't care about the content at all
total_ages # => 6174

#remove people with age 100 and greater.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

#my solution
ages.each do |key, value|
  if value > 100
    ages.delete(key)
  end
end

#LS solution
ages.keep_if { |_, age| age < 100 }

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min

#Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#my solution
flintstones.each_with_index do |element, index|
  if element.start_with?("Be")
    puts "#{element} is at index position #{index}."
  end
end

#Launch School solution
flintstones.index { |name| name[0, 2] == "Be" }

#Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.count(letter)
  result[letter] = letter_frequency if letter_frequency > 0
end
