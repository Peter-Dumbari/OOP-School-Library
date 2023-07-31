require './person'

class Student < Person
  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end

student = Student.new('B')
p student.play_hooky