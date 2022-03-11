=begin
Cute angles
Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
=end

DEGREE = "\xC2\xB0"

def dms(num)
  degrees = num.to_i
  minutes = ((num % 1) * 60).to_i
  seconds = ((((num % 1) * 60) % 1) * 60).round(2).to_i
  if seconds == 60
    minutes += 1
    seconds = 0o0
  end
  degrees = degrees.to_s
  minutes = minutes.to_s
  seconds = seconds.to_s

  p "#{degrees}#{DEGREE}#{"%02d" % minutes}'#{"%02d" % seconds}\""
end
