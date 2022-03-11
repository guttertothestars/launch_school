a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a1 = a.map { |x| x.split(' ') }

p a
puts "break"
a = a1.flatten
p a
