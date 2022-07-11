=begin
In this kata we will make a generator that generates text in a similar
pattern, but instead of scrambled or reversed, ours will be sorted
alphabetically

Requirement
return a string where:

the first and last characters remain in original place for each word
characters between the first and last characters must be sorted
alphabetically punctuation should remain at the same place as it
started, for example: shan't -> sahn't

Assumptions
1. words are seperated by single spaces
2. only spaces separate words, special characters do not, for example:
  tik-tak -> tai-ktk
3. special characters do not take the position of the non special
  characters, for example: -dcba -> -dbca
4. for this kata puctuation is limited to 4 characters: hyphen(-),
apostrophe('), comma(,) and period(.)
5. ignore capitalisation
=end

def scramble_words(words)
  #your code here
end

def bubble_sort(array)
  array_length = array.size
  return array if array.length <= 1 #no need to sort empty or single element arrays

  loop do
    #create a break condition to prevent infinite loop
    swapped = false

    #subtract one because Ruby indexes are zero based
    (array_length-1).times do |idx|
      if array[idx] > array[idx + 1]
        array[idx], array[idx+1] = array[idx+1], array[idx]
        swapped = true
      end
    end

    break if not swapped
  end

  array
end
