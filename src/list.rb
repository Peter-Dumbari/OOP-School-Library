class List
  def books(books_list)
    if books_list.empty?
      puts 'No record found! Add some books...'
    else
      puts 'Available books in the library'
      books_list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def people(people_list)
    if people_list.empty?
      puts 'No record found! Add a person...'
    else
      puts 'All people in the library'
      people_list.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def rentals(rentals_list)
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    rentals_list.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
