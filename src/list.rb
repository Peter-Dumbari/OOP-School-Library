require_relative '../app/filemanager'

class List
  def initialize(parent)
    @parent = parent
    @dmanager = FileManager.new
    @parent.books_list = @dmanager.books_list
    @parent.people_list = @dmanager.people_list
    @parent.rentals_list = @dmanager.rentals_list
  end

  def books
    if @parent.books_list.empty?
      puts 'No record found! Add some books...'
    else
      puts 'Available books in the library'
      @parent.books_list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def people
    @parent.people_list = PersonWriter.new(nil).read

    if @parent.people_list.empty?
      puts 'No record found! Add a person...'
    else
      puts 'List of people in the library'
      puts
      @parent.people_list.each do |person|
        puts "Name: #{person.name}
        \n ID: #{person.id}
        \n Age: #{person.age}
        \nparent_permission: #{person.parent_permission}"
        puts
      end
    end
  end

  def rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'

    @parent.rentals_list.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end
end
