=begin
Right Triangles
Write a method that takes a positive integer, n, as an argument, and displays a
right triangle whose sides each have n stars. The hypotenuse of the triangle
(the diagonal side in the images below) should have one end at the lower-left
of the triangle, and the other end at the upper-right.

Examples:
triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

=end

  def triangle(length)
    count = 0
    while length > 1
      puts"#{' ' * (length - 1)}#{'*' * (count + 1)}"
      count += 1
      length -=1
    end
    puts "#{'*' * (count + 1)}"
  end

  #LAUNCH SCHOOL SOLUTION:
  def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end
