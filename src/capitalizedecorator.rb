require_relative 'basedecorator'

class CapitalizeDecorator < BaseDecorator
  attr_accessor :name

  def initialize(nameable)
    super(nameable)
    @name = nameable.name
  end

  def correct_name
    @name = @name.capitalize
    @name
  end
end
