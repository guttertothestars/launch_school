=begin
Build a program that displays when the user will retire and how many years she has to work till retirement.

Example:

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

require 'date' #loads Date library and associated methods


def calculate_years_to_go(age, target_retirement)
  years_to_go = target_retirement - age
end

def retirement_year(years_to_go)
  Date.today.year + years_to_go
end

def when_will_i_retire()
  puts "Hello there pa'dner. You like a little tired"
  sleep 2
  puts "At what age would you like to retire?"
  target_retirement = gets.chomp!.to_i
  sleep 2
  puts "Dang. You don't look anywhere near that old. How old are you?"
  age = gets.chomp!.to_i
  sleep 3

  puts "It's #{Date.today.year}, you'll retire in #{retirement_year(calculate_years_to_go(age, target_retirement))}"
  puts "only #{calculate_years_to_go(age, target_retirement)} years to go"
end

p when_will_i_retire
