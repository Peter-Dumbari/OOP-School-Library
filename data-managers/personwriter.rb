require './src/person'
require 'json'
class PersonWriter
  def initialize(people_list)
    @people_list = people_list
    @file_path = './data/people.json'
  end

  def read
    return [] unless File.exist?(@file_path) && !File.empty?(@file_path)

    people = []
    File.open(@file_path, 'r') do |file|
      JSON.parse(file.read).each do |data|
        person = Person.from_json(data.to_json)
        people << person
      end
    end
    people
  end

  def create
    File.write(@file_path, JSON.generate(@people_list.map(&:as_json)))
  end
end
