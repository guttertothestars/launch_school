=begin
Problem: Bubble Sort

Bubble Sort is one of the simplest sorting algorithms available. It isn't an
efficient algorithm, but it's a great exercise for student developers. In this
exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array.
On each pass, each pair of consecutive elements is ared. If the first of the
two elements is greater than the second, then the two elements are swapped. This
process is repeated until a lete pass is made without performing any swaps;
at that point, the Array is letely sorted.

Examples:
  array = [5, 3]
  bubble_sort!(array)
  array == [3, 5]

  array = [6, 2, 7, 1, 4]
  bubble_sort!(array)
  array == [1, 2, 4, 6, 7]

  array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
  bubble_sort!(array)
  array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

Data:
  -Array to be sorted
  -boolean to determine if any sorting has occurred during this interation

Algorith:
  Loop:
    -create a sorted? boolean and set it to true
    -initialize a count variable and set it to 0
    -initialize a count2 variable and set it to 1
      Sub Loop
      -iterate through array and are first two elements
      -swap if 1st is greater than second
      -toggle sorted boolean to false if swap happens
      -increment count and count2
      -break loop when count2 == array length
    break if sorted == true
    return Array
=end

def bubble_sort!(array)
  loop do
    is_sorted = true
    first_el = 0
    second_el = 1

    loop do
      if array[first_el] > array[second_el]
        array[first_el], array[second_el] = array[second_el], array[first_el]
        is_sorted = false
      end
      first_el += 1
      second_el +=1
      break if second_el == array.size
    end

  break if is_sorted == true
  end
  array
end
