=begin
Always Return Negative
Write a method that takes a number as an argument. If the argument is a positive
number, return the negative of that number. If the number is 0 or negative,
return the original number.

Examples:
negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby

DATA:
integers

Algorithm:
  -Check for int status
  -check for positivity
  -multiply by -1 if positive
  return num
=end

def negative(num)
  unless num.to_s.match(/[0-9]/) #starting to add validation as a practice
    return "not valid num"
  end

  num > 0 ? -num : num #Terneray operator is a better solution
end
=begin --> This was my original solution
  case
  when num > 0
    num * -1
  when num == 0
    0
  when num < 0
    num
  end
  =end
