vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def vehicle_count(array)
  counted_vehicles = {}

  vehicles.uniq.each do |element|
    counted_vehicles[element] = array.count(element)
  end

  counted_vehicles.each do |element, count|
    puts "#{element} => #{count}"
  end
end
