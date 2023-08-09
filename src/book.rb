class Book
  attr_accessor :date, :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(data['title'], data['author'], data['name'])
  end

  def as_json(_options = {})
    {
      type: 'Book',
      name: @title,
      age: @author,
      rentals: @rentals
    }
  end
end
