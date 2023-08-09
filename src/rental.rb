class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(data['date'], data['book'], person: data['person'])
  end

  def as_json(_options = {})
    {
      type: 'Rental',
      date: @date,
      book: @book,
      person: @person
    }
  end
end
