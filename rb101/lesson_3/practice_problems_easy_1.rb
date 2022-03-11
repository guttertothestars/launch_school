
#What is the expexted output?
#An array: numbers: [1,2, 2,3] because numbers#uniq does not mutate the caller

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

#what is != and where should you use it?
# != is used anywhere you want a not equals comparison between two values

#put ! before something, like !user_name
# ! is the used to negate something - false will be true and true will be false


  #put ! after something, like words.uniq!
  #to show a method will mutate the caller

  #put ? before something
  #does one do this?

  #put ? after something
  #shows that the method will return a boolean

  #put !! before something, like !!user_name
  #double negation, does nothing

advice = "Few things in life are as important as house training your pet dinosaur."
advice["important"] = "urgent"
puts advice

advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!('important', 'urgent')
#.sub! only subs 1st instance of word. use .gsub! for every instance
puts advice

  numbers = [1, 2, 3, 4, 5]
  numbers.delete_at(1)
  #puts [1,3,4,5]
  p numbers


  numbers = [1, 2, 3, 4, 5]
  numbers.delete(1)
  #puts [2,3,4,5]
  p numbers

p (10..100).include?(42)
p (10..100).include?(42) #same same
# 10..100.cover? 42 is the LS solution. .cover? vs .conclude has some interesting differences

famous_words = "seven years ago..."
famous_words = "Four score and #{famous_words}"
puts famous_words
famous_words = "seven years ago..."
puts "Four square and " + famous_words
#LS Solutions
puts famous_words.prepend("Four stars and ")
famous_words = "seven years ago..."
puts "Forty acres and " << famous_words

flinstones = ["Fred", "Wilma"]
flinstones << ["Barney", "Betty"]
flinstones << ["Rambam", "Pebbles"]

p flinstones.flatten! #don't forget that flatten does not mutate the caller, needs flatten!

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")
