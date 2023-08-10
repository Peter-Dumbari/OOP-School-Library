require_relative '../src/person' # Adjust the path as needed
require_relative '../src/teacher' # Assuming this code is in a file named 'teacher.rb'
require 'json'

describe Teacher do
  let(:age) { 30 }
  let(:specialization) { 'Math' }
  let(:name) { 'Jane Smith' }
  let(:parent_permission) { true }
  let(:teacher) { Teacher.new(age, specialization, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'creates a Teacher object with correct attributes' do
      expect(teacher).to be_a(Teacher)
      expect(teacher.age).to eq(age)
      expect(teacher.name).to eq(name)
      expect(teacher.parent_permission).to eq(parent_permission)
      expect(teacher.instance_variable_get(:@specialization)).to eq(specialization)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for teachers' do
      expect(teacher.can_use_services?).to eq(true)
    end
  end

  describe '.from_json' do
    it 'creates a Teacher object from JSON data' do
      json_data = {
        'age' => 30,
        'specialization' => 'Math',
        'name' => 'Jane Smith'
      }.to_json

      new_teacher = described_class.from_json(json_data)

      expect(new_teacher).to be_a(Teacher)
      expect(new_teacher.age).to eq(30)
      expect(new_teacher.name).to eq('Jane Smith')
      expect(new_teacher.instance_variable_get(:@specialization)).to eq('Math')
      expect(new_teacher.parent_permission).to eq(true)
    end
  end

  describe '#as_json' do
    it 'returns the teacher data as a JSON hash' do
      json_hash = teacher.as_json

      expect(json_hash).to eq(
        type: 'Teacher',
        id: teacher.id,
        name: name,
        age: age,
        specialization: specialization,
        parent_permission: parent_permission
      )
    end
  end
end
