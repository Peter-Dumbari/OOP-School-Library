require_relative '../src/rental' # Assuming the class is in a file named 'rental.rb'
require 'json'

RSpec.describe Rental do
  let(:date) { '2023-08-09' }
  let(:book) { 'Sample Book' }
  let(:person) { 'John Doe' }
  let(:rental) { Rental.new(date, book, person) }

  describe '#from_json' do
    it 'creates a Rental object from JSON data' do
      json_data = {
        'date' => '2023-08-09',
        'book' => 'Sample Book',
        'person' => 'John Doe'
      }.to_json

      new_rental = described_class.from_json(json_data)

      expect(new_rental).to be_a(Rental)
      expect(new_rental.date).to eq('2023-08-09')
      expect(new_rental.book).to eq('Sample Book')
      expect(new_rental.person).to eq('John Doe')
    end
  end

  describe '#as_json' do
    it 'returns the rental data as a JSON hash' do
      json_hash = rental.as_json

      expect(json_hash).to eq(
        type: 'Rental',
        date: date,
        book: book,
        person: person
      )
    end
  end
end
