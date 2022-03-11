ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.include?("Spot")
p ages.any?("Spot")
# p ages.fetch("Spot") will give error if not present
p ages.has_key?("Spot")
p ages.include?("Lily")

munsters_description = "The Munsters are creepy in a good way."
#LS solutions in comments
p munsters_description.upcase.sub("T", "t").sub("M", 'm')
# munsters_description.swapcase!
p munsters_description.downcase.capitalize
# munsters_description.capitalize!
p munsters_description.downcase
#~!
p munsters_description.upcase
#~!

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
#add ages for Marilyn and Spot to the existing hash
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
puts ages

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?("dino")

flinstones = %w(Fred Barney Wilma Pebbles Rambam)

p flinstones.push("Dino", "Hoppy")

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0..38)

p advice
#LS Solution advice.slice!(0, advice.index('house'))

statement = "The Flintstones Rock!"

statement.each_char { |chr| puts 1 if chr == 't' }
p statement.count('t')

title = "Flintstone Family Members"
# I was going to count the chars and center based on math...
p title.center(40)
