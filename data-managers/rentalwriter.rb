require 'json'

class RentalWriter
  def initialize(rentals_list)
    @rentals_list = rentals_list
    @file_path = './data/rentals.json'
  end

  def read
    rentals = []
    File.open(@file_path, 'r') do |file|
      JSON.parse(file.read).each do |data|
        rental = Rental.from_json(data.to_json)
        rentals << rental
      end
    end
    rentals
  end

  def create
    File.write(@file_path, JSON.generate(@rentals_list.map(&:as_json)))
  end
end
