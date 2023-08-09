require 'json'

class BookWriter
 def initialize(book_list)
    @book_list = book_list
    @file_path = '../data/books.json'
  end
 
  def read
    return [] unless File.exist?(@file_path) && !File.empty?(@file_path)
 
    books = []
    File.open(@file_path, 'r') do |file|
      JSON.parse(file.read).each do |data|
        book = Book.from_json(data.to_json)
        books << book
      end
    end
    books
  end
 
  def create
    File.write(@file_path, JSON.generate(@books_list.map(&:as_json)))
  end
end
