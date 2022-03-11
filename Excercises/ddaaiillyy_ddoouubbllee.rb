=begin
Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze
or String#squeeze!.

Examples:

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
=end

def crunch(string)
  string.split.map{|word| word.chars.uniq.join}.join(' ')
end

#fails second test case as it removes ALL doubles, not just consecutive duplicates

def crunch(string)
  index = 0
  crunched_text = ''

  while index <= string.length - 1
    crunched_text << string[index] unless string[index] == string[index + 1]
    index += 1
  end
crunched_text
end
