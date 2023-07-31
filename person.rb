class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name, age, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def generate_id
    rand(1000..9999)
  end
end

person = Person.new('John', 17)
p person