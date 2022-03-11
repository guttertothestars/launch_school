=begin

PROBLEM

After Midnight (Part 1)
The time of day can be represented as the number of minutes before or after
midnight. If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.
Write a method that takes a time using this minute-based format and returns the
time of day in 24 hour format (hh:mm). Your method should work with any integer
input.

You may not use ruby's Date and Time classes.

HINT: The Integer#divmod method and the % (modulo) operator may prove useful in
your solution. You may also find Kernel#format handy for formatting your results.

You may want to solve this problem for non-negative arguments that are between
0 and 1439 first. Once you've done that, try handling arguments that are greater
than 1439. Finally, solve it for negative values. Think about how you might be
able to simplify the final two parts. (Hint: one day is 1440 minutes)

EXAMPLES/EDGE CASES:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

To limit edge cases consider rejecting all non-int arguments.
=end



def time_of_day(minutes)

  if minutes >= 0 && minutes <= 1439
    hours_and_minutes = minutes.divmod(60)
  elsif minutes >= 1440
    hours_and_minutes = minutes.divmod(1440)
    hours_and_minutes = hours_and_minutes[1].divmod(60)
  elsif minutes > -1440 && minutes < 0
     minutes = (1440 + minutes) #minutes is (-) so this is subtraction
     hours_and_minutes = minutes.divmod(60)
  else
    hours_and_minutes = minutes.abs.divmod(1440) #.abs to remove (-)
    minutes = (1440 - hours_and_minutes[1])
    hours_and_minutes = minutes.divmod(60)
  end

  hours_and_minutes.map! do |element|
    format("%02d", element)
  end
  hours_and_minutes.join(':')
end
