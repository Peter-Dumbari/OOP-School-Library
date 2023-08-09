require_relative 'nameable'
require_relative 'capitalizedecorator'
require_relative 'trimmerdecorator'
require 'pry'
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def self.from_json(json)
    data = JSON.parse(json)

    case data['type']

    when 'Student'
      Student.from_json(json)

    when 'Teacher'
      Teacher.from_json(json)
    end
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(0o01..0o60)
  end
end
