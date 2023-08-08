require_relative 'app/app'
require_relative 'src/person'
require_relative 'src/teacher'
require_relative 'src/student'
require_relative 'src/book'
require_relative 'src/rental'

class Main
  def initialize
    @app = App.new(self)
    show_menu
    display_welcome_message
  end

  def display_welcome_message
    puts

    puts 'WELCOME TO THE SCHOOL LIBRARY APP!'
  end

  def show_menu
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 -  List all books'
    puts '2 -  List all people'
    puts '3 -  Create a person'
    puts '4 -  Create a book'
    puts '5 -  Create a rental'
    puts '6 -  List all rentals for a given person id'
    puts '7 -  Exit'
    puts

    user_choice = gets.chomp

    select_option(user_choice)
  end

  def select_option(user_choice)
    options = {
      '1' => :list_all_books,
      '2' => :list_all_people,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_all_rentals,
      '7' => :exit
    }

    method = options[user_choice]
    if method.nil?
      puts 'Invalid option, please try again!'
      puts
      show_menu
    else
      send(method)
    end
  end

  def list_all_people
    @app.list_all_people
    show_menu
  end

  def list_all_books
    @app.list_all_books
    show_menu
  end

  def list_all_rentals
    @app.list_all_rentals
    show_menu
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]'
    person_role = gets.chomp

    person_options = {
      '1' => :create_student,
      '2' => :create_teache
    }

    method = person_options[person_role]
    if method.nil?
      puts 'Please enter a valid input!'
      show_menu
    else
      send(method)
    end
    puts
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    @app.add_people_list(Student.new(age, name, parent_permission: parent_permission))
    puts
    puts 'Person created successfully'
    show_menu
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @app.add_people_list(Teacher.new(age, specialization, name, parent_permission: true))
    puts
    puts 'Person created successfully'
    show_menu
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.add_book_list(Book.new(title, author))
    puts 'Book created successfully'
    show_menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @app.books_list.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    book_num = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not id)'
    @app.people_list.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_num = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @app.add_rental_list(Rental.new(date, @app.books_list[book_num], @app.people_list[person_num]))
    puts 'Rental created successfully'
    show_menu
  end

  def exit_app
    puts 'Thank you! Have a great day!'
    exit(0)
  end
end
Main.new
