class Rental
  attr_accessor :date, :book, :person

  def initialize(_date, book, person)
    @book = book

    book.rentals << self

    @person = person

    person.rentals << self
  end
end
