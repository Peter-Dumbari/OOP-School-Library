require 'rspec'
require_relative '../src/nameable'
require_relative '../src/capitalizedecorator'
require_relative '../src/trimmerdecorator'
require_relative '../src/person'
require_relative '../src/teacher' # Assuming this code is in a file named 'person.rb'

RSpec.describe Person do
  let(:name) { 'John Doe' }
  let(:age) { 25 }
  let(:parent_permission) { true }
  let(:person) { Person.new(age, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'creates a Person object with correct attributes' do
      expect(person).to be_a(Person)
      expect(person.name).to eq(name)
      expect(person.age).to eq(age)
      expect(person.parent_permission).to eq(parent_permission)
    end
 
    it 'generates a valid id' do
      expect(person.id).to be_between(1, 63)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eq(name)
    end
  end

  describe '.from_json' do
    it 'creates a Student object from JSON data' do
      student_data = {
        'type' => 'Student',
        'age' => 18,
        'name' => 'Jane Student',
        'parent_permission' => true
      }.to_json

      student = described_class.from_json(student_data)
      expect(student).to be_a(Student)
      expect(student.age).to eq(18)
      expect(student.name).to eq('Jane Student')
      expect(student.parent_permission).to eq(true)
    end

    it 'creates a Teacher object from JSON data' do
      teacher_data = {
        'type' => 'Teacher',
        'age' => 30,
        'name' => 'Mr. Teacher',
        'specialization' => 'Math',
        'parent_permission' => true
      }.to_json

      teacher = described_class.from_json(teacher_data)
      expect(teacher).to be_a(Teacher)
      expect(teacher.age).to eq(30)
      expect(teacher.name).to eq('Mr. Teacher')
      expect(teacher.instance_variable_get(:@specialization)).to eq('Math') # Corrected expectation
      expect(teacher.parent_permission).to eq(true)
    end
  end
end
