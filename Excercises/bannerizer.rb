=begin
WHAT'S IN THE BOX?!?!?!

Write a method that will take a short line of text, and print it within a box.

Example:print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

=end

def print_in_box(string)

  border_line = '-' * string.length
  blank_line = ' ' * (string.length + 2)
  puts "+-#{border_line}-+"
  puts "|#{blank_line}|"
  puts "| #{string} |"
  puts "|#{blank_line}|"
  puts "+-#{border_line}-+"
end 
