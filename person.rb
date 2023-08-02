require './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age,name, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
   p @name 
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1000..9999)
  end
end

class BaseDecorator < Nameable
    def initialize(nameable)
      super()
      @nameable = nameable
    end
  
    def correct_name
      @nameable.correct_name
    end
end

class CapitalizeDecorator < BaseDecorator
    def correct_name
      @nameable.correct_name.capitalize
    end
end

class TrimmerDecorator < BaseDecorator
    def correct_name
      @nameable.correct_name[0..9]
    end
end
  
  
person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name