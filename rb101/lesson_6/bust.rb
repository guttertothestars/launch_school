=begin
write a program that takes an array parameter and determines if the sum of the
array elements is greater than 21. The array will contain positive integers
between 2-10, and string characters, "J", "Q", "K", & "A".
J-K are worth 10, and aces are worth 1  || 11 depending on if an 11 would cause
array sum to exceed 21.

=end

def convert_aces(arr)
  if arr.sum > 21
    arr.map! do |el|
      if el == 11
        1
      else
        el
      end
    end
    arr.sum
  end
end

def bust?(array)
  total = array.map! do |element| # converts face cards to integer values
    if element == "A"
      11
    elsif element == "J" || element == "Q" || element == "K"
      10
    else
      element
    end
  end

  total = convert_aces(total)

  total > 21
end

def flash(msg)
  5.times do
    print "\r#{msg}"
    sleep 0.5
    print "\r#{' ' * msg.size}" # Send return and however many spaces are needed.
    sleep 0.5
    print "\r#{msg}"
  end
end


message = "Blood for the blood god!"
flash(message)
