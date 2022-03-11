=begin
Diamonds!
Write a method that displays a 4-pointed diamond in an n x n grid, where n is
an odd integer that is supplied as an argument to the method. You may assume
that the argument will always be an odd integer.

Examples:

diamond(1)

*

diamond(3)

 *
***
 *

 diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *



Data:
Strings

Algorith
print a sting object with *'s, starting with one, incrementing by two, up unto
an integer (n).
Reverse the process back down unto 1.

I have to keep the diamond centered so a loop wont work because I need to take
into account the widest part from the beginning.

=end

def diamond(n)
  stars = '*'


  until stars.length > n
    puts stars.center(n, ' ')
    stars << '**'
  end

  stars.chop!.chop!

  until stars.length == 1
    stars.chop!.chop!
    puts stars.center(n, ' ')
  end
end
