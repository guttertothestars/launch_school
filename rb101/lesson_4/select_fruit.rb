produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

=begin
my original work

fruits = Hash.new

produce.each do |key, value|
  if value == "Fruit"
    fruits[key] = value
  end
end

puts fruits
=end


#launch school version

def select_fruit(produce_list)
  produce_keys = produce_list.keys #creates an array of just produce list produce_keys
  counter = 0 #provides a counter to increment
  selected_fruits = {} #creates an empty hash to dump our selected fruits into

  loop do
    #break condition has to be at the top in case produce_list is an empty hash
    break if counter ==  produce_keys.size #exits when entire list of keys is iterated over

    current_key = produce_keys[counter] #sets the current key to the key found at index[counter] starting w/0 of the first key
    current_value = produce_list[current_key] #sets current_value to value of the produce key at current counter number

    #info extraction logic
    if current_value == "Fruit"
      selected_fruits[current_key] = current_value      #takes current key and value to insert key/value pair into selected_fruits hash
    end

    counter += 1 #increments count

  end #ends loop

  selected_fruits #returns selected_fruits hash

end

puts select_fruit(produce)
