require_relative '../src/trimmerdecorator'
require_relative '../src/basedecorator'
require 'rspec'

class NameableStub
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

RSpec.describe TrimmerDecorator do
  let(:nameable_stub) { NameableStub.new('Lorem Ipsum Dolor Sit Amet') }
  let(:decorated_nameable) { TrimmerDecorator.new(nameable_stub) }

  describe '.correct_name' do
    it 'returns the name trimmed to 10 characters' do
      trimmed_name = decorated_nameable.correct_name
      expect(trimmed_name).to eq('Lorem Ipsu')
    end
  end
end
