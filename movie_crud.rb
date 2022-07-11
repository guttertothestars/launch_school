# use Text::Levenshtein.distance('test', 'test')
# to ask if user meant a hash word w/in 2(3?4?) steps distance

# Holistic Inventory, Rations Ecosystem for Mainstream Enterprise




movies = {
  "Rambo": 4,
  "Encino Man": 11,
  "The Matrix": 2
}

puts "--choose 'add' 'update' 'display' or 'delete'"
choice = gets.chomp

case choice
  when "add"
    puts "Title?"
    title = gets.chomp
    puts "Rank it 1 - 4"
    rating = gets.chomp
      if movies[title.to_sym].nil?
        movies[title.to_sym] = rating.to_i
        puts "Added!"
      else
        puts "That movie already exists!"
      end

  when "update"
    puts "What would you like to update?"
    title = gets.chomp
      if movies[title.to_sym].nil?
        puts "That movie is not in your DB yet."
      else
        puts "What is your new rating?"
        rating = gets.chomp
        movies[title.to_sym] = rating.to_i
        puts "Updated!"
        puts movies
      end

  when "display"
    movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
  end

  when "delete"
    puts "What would you like to delete?"
    title = gets.chomp
      if movies[title.to_sym].nil?
        puts "That movie is not in your DB yet."
      else
        movies.delete(title.to_sym)
        puts "Gone, baby gone."
      end

  else
    puts "Pick a valid option"
end
