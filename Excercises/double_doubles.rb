=begin
Double Doubles
A double number is a number with an even number of digits whose left-side digits
are exactly the same as its right-side digits. For example, 44, 3333, 103103,
7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless
the argument is a double number; double numbers should be returned as-is.

Examples:

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
=end

def twice(num)
  first_half = []
  num = num.digits.reverse

  if num.length.even?
    until first_half.size == num.size
      first_half << num.shift
    end

    if first_half == num
      num = num + first_half
      num.join.to_i
    else
      num = num + first_half
      num.join.to_i * 2
    end
  else
    num.join.to_i * 2
  end
end


#LaunchSchool Solution
def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end
