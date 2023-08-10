class Book
  attr_accessor :title, :author, :rentals

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
    new(data['name'], data['age']) # Use 'name' and 'age' instead of 'title' and 'author'
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
