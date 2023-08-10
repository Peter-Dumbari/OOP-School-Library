require_relative '../spec/spec_helper'
require_relative '../src/classroom'
require_relative '../src/student'



RSpec.describe Classroom do
  let(:classroom_label) { 'Math' }
  let(:classroom) { Classroom.new(classroom_label) }
  let(:student) { Student.new('John Doe') }

  describe "attributes" do
    it "has the correct initial attributes" do
      expect(classroom.label).to eq(classroom_label)
      expect(classroom.students).to be_empty
    end
  end

  describe "#add_student" do
    it "adds a student to the classroom" do
      classroom.add_student(student)
      expect(classroom.students).to eq([student])
    end

    it "sets the classroom attribute of the student" do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
