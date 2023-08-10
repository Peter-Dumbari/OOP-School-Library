require_relative '../spec/spec_helper'
require 'json'
require_relative '../src/book'

RSpec.describe Book do
  let(:book_title) { "Sample Book" }
  let(:book_author) { "John Doe" }
  let(:rental) { "Sample Rental" }
  let(:book) { Book.new(book_title, book_author) }

  describe "attributes" do
    it "has the correct initial attributes" do
      expect(book.title).to eq(book_title)
      expect(book.author).to eq(book_author)
      expect(book.rentals).to be_empty
    end
  end

  describe "#add_rental" do
    it "adds a rental to the rentals array" do
      book.add_rental(rental)
      expect(book.rentals).to eq([rental])
    end
  end

  describe ".from_json" do
    it "creates a book object from JSON data" do
      json_data = '{"type":"Book","name":"Sample Book","age":"John Doe","rentals":[]}'
      book_from_json = Book.from_json(json_data)
      
      expect(book_from_json).to be_an_instance_of(Book)
      expect(book_from_json.title).to eq(book_title)
      expect(book_from_json.author).to eq(book_author)
      expect(book_from_json.rentals).to be_empty
    end
  end

  describe "#as_json" do
  it "returns a valid JSON representation of the book" do
    expected_json = {
      type: 'Book',
      name: book_title,
      age: book_author,
      rentals: []
    }

    expect(book.as_json).to eq(expected_json)
  end
end
end
