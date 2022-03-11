=begin
1000 Lights
You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row of
switches and toggle every one of them. You go back to the beginning, and on this
second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go
back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat
this process and keep going until you have been through n repetitions.

Every n trip through the array you toggle every n switch

Write a method that takes one argument, the total number of switches, and
returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].

Data: a starting array, and ending array. I'm thinking a hash to track index and of/on status
also thinking of a helper method to toggle off/on

Want to iterate through a hash every nth key, and toggle the value.

=end

def switch(hash_val)
  if hash_val == "on"
    hash_val = "off"
  else
    hash_val = "on"
  end
end

def light_fandango(n)
  array = (1..n).to_a
  lightbulbs = array.each_with_object({}) { |num, hash| hash[num] = "on" }

  counter = 2
  (n - 1).times do
    lightbulbs.map do |key, val|
      if key % counter == 0
        lightbulbs[key] = (switch(lightbulbs[key]))
      else
        lightbulbs[key] = val
      end
    end
    counter += 1
  end

  results = []
  lightbulbs.each do |k, v|
    if v == "on"
      results << k
    end
  end
  results
end
