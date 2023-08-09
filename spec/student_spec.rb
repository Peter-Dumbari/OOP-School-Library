require_relative '../src/student'
require_relative '../src/classroom'
require 'json'

describe Student do
  let(:age) { 18 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }
  let(:classroom) { double('Classroom') }
  let(:student) { Student.new(age, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'creates a Student object with correct attributes' do
      expect(student).to be_a(Student)
      expect(student.age).to eq(age)
      expect(student.name).to eq(name)
      expect(student.parent_permission).to eq(parent_permission)
    end
  end

  describe '#play_hooky' do
    it 'returns the play_hooky message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#can_use_services?' do
    it 'returns true for students aged 18 or with parent permission' do
      expect(student.can_use_services?).to eq(true)
    end

    it 'returns false for students under 18 without parent permission' do
      underaged_student = Student.new(17, name, parent_permission: false)
      expect(underaged_student.can_use_services?).to eq(false)
    end
  end

  describe '#classroom=' do
    it 'sets the classroom and adds student to classroom' do
      allow(classroom).to receive(:students).and_return([])
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '.from_json' do
    it 'creates a Student object from JSON data' do
      json_data = {
        'age' => 18,
        'name' => 'John Doe',
        'parent_permission' => true
      }.to_json

      new_student = described_class.from_json(json_data)

      expect(new_student).to be_a(Student)
      expect(new_student.age).to eq(18)
      expect(new_student.name).to eq('John Doe')
      expect(new_student.parent_permission).to eq(true)
    end
  end

  describe '#as_json' do
    it 'returns the student data as a JSON hash' do
      json_hash = student.as_json

      expect(json_hash).to eq(
        type: 'Student',
        id: student.id,
        name: name,
        age: age,
        parent_permission: parent_permission
      )
    end
  end
end
