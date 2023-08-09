require_relative '../src/list'
require_relative 'filemanager'

class App
  attr_accessor :books_list, :people_list, :rentals_list

  def initialize(parent)
    @parent = parent
    @books_list = []
    @people_list = []
    @rentals_list = []
    @list = List.new(self)
    @filemanager = FileManager.new
  end

  def initialize_data
    @filemanager.initialize_data
  end

  def list_all_people
    @list.people
  end

  def list_all_books
    @list.books
  end

  def list_all_rentals
    @list.rentals
  end

  def add_people_list(person)
    @people_list.push(person)
    @filemanager.filewriter = PersonWriter.new(@people_list)
    @filemanager.create
  end

  def add_book_list(book)
    @books_list.push(book)
    @filemanager.filewriter = BookWriter.new(@books_list)
    @filemanager.create
  end

  def add_rental_list(rental)
    @rentals_list.push(rental)
    @filemanager.filewriter = RentalWriter.new(@rentals_list)
    @filemanager.create
  end
end
