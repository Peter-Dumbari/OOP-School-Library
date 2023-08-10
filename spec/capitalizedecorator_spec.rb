require_relative '../spec/spec_helper'
require_relative '../src/basedecorator'
require_relative '../src/capitalizedecorator'

class MockNameable
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def correct_name
    @name.capitalize
  end
end

RSpec.describe CapitalizeDecorator do
  let(:mock_nameable) { MockNameable.new('sample name') }
  let(:decorator) { CapitalizeDecorator.new(mock_nameable) }

  describe "initialization" do
    it "sets the nameable attribute correctly" do
      expect(decorator.instance_variable_get(:@nameable)).to eq(mock_nameable)
    end

    it "sets the name attribute correctly" do
      expect(decorator.name).to eq('sample name')
    end
  end

  describe "#correct_name" do
    it "capitalizes the name" do
      allow(mock_nameable).to receive(:name).and_return('sample name')
      expect(decorator.correct_name).to eq('Sample name')
    end
  end
end
