# Main method
choice = nil

while choice != 7
  puts "\n--- Library Management System ---"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Exit'
  puts 'Enter your choice:'

  choice = gets.chomp.to_i

  case choice
  when 1
    puts 'one'
  when 2
    puts 'two'
  when 3
    puts 'three'
  when 4
    puts 'four'
  when 5
    puts 'five'
  when 6
    puts 'six'
  when 7
    puts 'Exiting...'
    break
  else
    puts 'Invalid choice!'
  end
end
