puts "How big is the bill?"
bill = gets.chomp!.to_f

puts "what percent would you like to tip?"
tip = gets.chomp!.to_f
tip = tip / 100

tip = bill * tip
puts "The tip is: $#{tip}"
total = bill + tip
puts "the total is: $#{total}"
