require_relative 'person'
require 'pry'
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(data['age'], data['name'], parent_permission: data['parent_permission'])
  end

  def as_json(_options = {})
    {
      type: 'Student',
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }
  end
end
