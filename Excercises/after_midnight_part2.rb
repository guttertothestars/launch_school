=begin
After Midnight (Part 2)
As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:
after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

=end
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR


def before_midnight(time)
  time = time.split(':')
  time.map! do |el|
    el.to_i
  end
  time[0] = time[0] * MINUTES_PER_HOUR
  if MINUTES_PER_DAY - time.sum == 1440
    return 0
  end

  MINUTES_PER_DAY - time.sum
end

def after_midnight(time)
  time = time.split(':')
  time.map! do |el|
    el.to_i
  end
  time[0] = time[0] * MINUTES_PER_HOUR
    if time.sum == 1440
      return 0
    else
      time.sum
    end
end 
