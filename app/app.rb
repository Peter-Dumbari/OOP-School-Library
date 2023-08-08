require_relative '../src/list'

class App
  attr_reader :books_list, :people_list

  def initialize(parent)
    @parent = parent
    @books_list = []
    @people_list = []
    @rentals_list = []
    @list = List.new
  end

  def list_all_people
    @list.people(@people_list)
  end

  def list_all_books
    @list.books(@books_list)
  end

  def list_all_rentals
    @list.rentals(@rentals_list)
  end

  def add_people_list(person)
    @people_list.push(person)
  end

  def add_book_list(book)
    @books_list.push(book)
  end

  def add_rental_list(rental)
    @rentals_list.push(rental)
  end
end
