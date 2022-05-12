=begin
Problem: Unlucky Days
Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

Examples:
  friday_13th(2015) == 3
  friday_13th(1986) == 1
  friday_13th(2019) == 2

data:
  -date object

Algorithm
  -initialize a date object for the first day of the given year
  -set a limit of the last day of the year
  -iterate through to check for days that are both 1) friday and 2) 13th of the month
  -sum them

=end
require 'date'

def friday_13th(year)

  Date.new(year).step(Date.new(year,-1,-1)).
  select {|day| day.friday? && day.mday == 13 }.size

end

# Date.new(year).step(Date.new(year,-1,-1))
# creates a date object ranging from the 1st of the given year to the last
# of the given year. Date.new w/just a year defaults to 1,1. year, -1, -1 is
# the last day of the last month (neg. indexing)

# .select called on the enumerable object allows iteration through each element
# which are days in this case
# .mday returns the (m)onth day numeric
