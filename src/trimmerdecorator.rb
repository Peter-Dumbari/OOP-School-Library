require_relative 'basedecorator'

class TrimmerDecorator < BaseDecorator
  attr_accessor :name

  def initialize(nameable)
    super(nameable)
    @name = nameable.name
  end

  def correct_name
    @name[0..9]
  end
end
