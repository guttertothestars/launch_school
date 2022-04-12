=begin
Problem: Tri-Angles
A triangle is classified as follows:

*right: One angle of the triangle is a right angle (90 degrees)
*acute: All 3 angles of the triangle are less than 90 degrees
*obtuse: One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and
all angles must be greater than 0: if either of these conditions is not
satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns
a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle
is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating
point errors. You may also assume that the arguments are specified in degrees.

Examples:
  triangle(60, 70, 50) == :acute
  triangle(30, 90, 60) == :right
  triangle(120, 50, 10) == :obtuse
  triangle(0, 90, 90) == :invalid
  triangle(50, 50, 50) == :invalid

  data:
  -integers (from args)
  -array

  Algorithm
  -check for 0 and !180 sum
  -check for 90/right
  -check for obtuse

  =end

  def triangle(x, y, z)
    tri = [x, y, z]

    case
    when tri.include?(0), tri.sum != 180   then :invalid
    when tri.sort.max > 90                 then :obtuse
    when tri.sort.max == 90                then :right
    else                                        :acute
    end

  end
