
#What does the code output and/or return?
#Why?
#What concept does the example demonstrate?


a = “Hello”
b = a
a = “Goodbye”
puts a
puts b

=begin
Lines 7-11 will output:
  "Goodbye"
  "Hello"
and Return Nil twice

On `line 7` we initialize a local variable `a` and and assign it to a `string`
object "Hello"
On `line 8` we initialize a local variable `b` and assign it to the string object
referenced by local variable `a`
On `line 9` we reasign local varable `a` to a new `string` object "Goodbye"

On `Line 10` the `puts` method is invoked with local variable `a` passed in
as an argument. The output is the string object referenced by `a` and the return is nil
On `Line 11` the `puts` method is invoked with local variable `b` passed in
as an argument. The output is the string object referenced by `b` and the return is nil

This problem demonstrates the concept of variables as pointers. When local
`b` is initialized and assigned to `a` it is actually assigned to the string
object a is pointing at. When a is reasigned it points to a new string object in
a different memory space.
=end


# Example 2
# What does the following code return? What does it output?
# Why?
# What concept does it demonstrate?

a = 4

loop do
  a = 5
  b = 3

  break
end

puts a
puts b

`Line 51` will output an integer `5` and return `Nil`
`Line 52` will throw a NameError for an undefined local variable.

This code demonstrates the concept of local variable scope. On `line 42` we
initialize a local varable `a` and assign it to an `integer` 4 This variable has
outer scope and is available for use throughout the program.

on `linea 44-49` we invoke the `loop` method and pass in a `do...end` block as
an argument. The `loop` method has access to outer scoped variables but creates its
own inner scope. Variables initialized within the `loop` method are not accessable
outside of the loop method.

within the block we reassign local variable `a` to the integer `5` on `line 45`
on `line 46` we initalize local variable `b` and assign it to `integer` object `3`
and on `line 48` the keyword `break` provides the break condition for exiting the `loop`

This problem demonstrates variable scope in Ruby. Since `b` was initalized within
the `loop` method it is not accessible outside of it - thus the NameError on line 52
Since `a` was initialized outside the `loop` method the block has access to it and
variable reassignment that occurs within the loop is reflected outside of it.


a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b

`line 85` and 'line 86' will output 4 and 3 respectively, and both will
return nil. On `line 76` we initalize local variable `a` and assign it to the
integer `4`. On `line 77` we initalize local variable `b` and assignt it to
the integer `4`

on `lines 79-83` we invoke the `loop` method and pass in a `do...end block` as an
argument. Within that block we intialize a variable `c` that is available only
within the loop, and we assign it to the `integer 3`. On 'line 81' we reassign the
variable `a` to the value of the variable 'c', which is `3`.

This demostrates the concept of local variable scope. local variable 'a' is
available within the method invocation since it is passed in within a block argument.
the variable `c` is available to 'a' for reassignment within the block, but is
not accessible outside of it. Local variable `b` assigned to integer `2` outside
of the loop method invocation is, of course, available anywhere outside the loop.

def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)

This code ouputs a string argument passed in to a method invocation followed by the
output of the string "Goodbye" It returns nil.

On `lines 104-107` we define a method `greetings` with one parameter `str`. The
method invokes the puts method on the `str` variable passed in as an argument.
It then invokes the puts method on the string `Goodbye`.

on `line 109` we are intializing a local variable `word` and assigning it to
the `string "hello"`. On `line 111` we invoking the `greetings` method and are
passing in the variable `word` as an argument.

This code snippet demonstrates variable scope as related to method definition.
Methods create their own scope. For a method to access to a variable it has to be
defined with a parameter during method definition, that can be accessed as an
argument during invocation.


arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end

puts "Your total is #{sum}"

What does the following code return? What does it output? Why?
What concept does it demonstrate?

This code snippet outputs `Your total sum is 10` and returns `nil`
This code demonstrates local variable scope and block access to local variables.

because the `loop` method invocation uses a `do...end` block it has access to the
local variables initalized on lines 130-132.


# How many objects are there after this first set of local variable assignments?

a = 'hello'
b = a
c = 'goodbye'
d = b

###

a = a.upcase!
b += ', world!'
c = b
d = c + ' Until tomorrow!'

# at this point in the code, how many objects do we have? What does the code below output?

puts a
puts b
puts c
puts d


What does the following code return? What does it output? Why?
What concept does it demonstrate?

def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')

The `example(str)` method invocation outputs the string 'hello' 3 times and
returns `nil`.

The `example(str)` method is defined with one parameter, `str`,
and on line 178 the local variable `i` is initialized to the integer `3` the `loop`
method is invoked with a `do...end` block. each iteration of the `loop` invokes
the `puts` method and passes in the `str` variable which outputs the value of `str`
The variable `i` is then decremented by one, using reassignment. Lastly, the `loop`
checks to see if its `break` criteria has been met.


What does the following code return? What does it output? Why?
What concept does it demonstrate?

a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a

The following code both outputs and returns "Bill"

on `line 202` we initialize local variable `a` and assign it to a string object
with the value `Bob`.

on `lines 204-6` we invoke the `times` method on integer object `5` and pass in a
`do...end` block as an argument. On `line 204` the block variable `x` is initialized,
but is unused. on `line 205` local variable `a` is reassigned to a string object
with the value `Bill`. This reassignment happens 5 times.

on line `208` we invoke the `p` method and pass in `a` as an argument, which outputs
and returns `Bill`

This demonstrates local variable scope. The local variable `a`, initialized outside
of the `do...end` block is available to the `times` method only within the block.
because `a` is available within the block we are able to reassign it.

What does the following code return? What does it output? Why?
What concept does it demonstrate?

a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

The following code outputs `5` twice, `4` once, and `2` once. It returns `nil`

On `lines 230-231` we intitialze two local variables, `a` and `b` assigning them
to the integer objects `4` and `2` respectively.

On `lines 233-236` we invoke the
`times` method on integer `2`, passing in a `do...end block` argument. Within the
block we initialize a block variable `a` and assign it to the integer object `5`.
we then invoke the `puts` method, and pass in the value of block variable `a` as
the argument. This outputs `5`. This happens twice.

Lastly we invoke the puts method on local vaiable `a` and local variable `b`.

This demonstrates the concept of variable shadowing. because we are initializing
a block variable with the same name as our local variable the block does not have
access to the local variable. Thus `line 234` is not reassignment. Once the
block is executed the program has no access to variables initialized w/in the block
and local variable `a` is unchanged.



What does the following code return? What does it output? Why?
What concept does it demonstrate?

animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal

The following code returns `nil` and outputs the string `dog`. On
`line 265` we initialize local variable `animal` and assign it to the
string object `dog`

on `lines 267-70` we invoke the `loop` method and pass in a `do...end` block
as an argument. Within the block we initialize the block variable
`animal` and assign it to the string object `cat`. We then break from
the `loop`.

on `line 272` we invoke the `puts` method on the local variable `animal`,
outputting `dog`.

This code snippet demonstrates the concept of variable shadowing. Since
we initialized a block variable with the same name as a local variable
what occurs on `line 268` is actually assignment of a block variable and
not reassignment of a local variable. Were we to pass in the block with a block
variable of a different name then `line 272` would output `cat`.

What does the following code return? What does it output? Why?
What concept does it demonstrate?

a = "hi there"
b = a
a = "not here"

What are a and b?

by `line 297` `a` is assigned to the string object `not here` and `b` is assigned
to the string object `hi there`.

On `line 295` we are initializing local variable `a` and assigning
it to the string object `hi there`on `line 296` we are initializing
local variable `b` and assigning
it to the value of the local variable `a`. on `line 297` we are reassigning
local variable `a` to the string object `not here`

This demonstrates the concept of variables as pointers. When we initialize
local variable `a` it is pointing at a specific place in the computer's memory.
when we initalize local variable `b` and assign it to the value pointed at by `a`
we can see that both variables point to the same spot in memory by calling
a.object_id and b.object_id and comparing. When we reassign `a` we are pointing
it to a new memory space, which can be proven by calling a.object_id again.
