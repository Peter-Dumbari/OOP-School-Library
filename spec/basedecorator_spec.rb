require_relative '../spec/spec_helper'

RSpec.describe BaseDecorator do
  describe '#correct_name' do
    let(:nameable) { instance_double(Nameable) }

    before do
      allow(nameable).to receive(:correct_name).and_return('Mocked Correct Name')
    end

    it 'returns the correct name from the nameable object' do
      decorator = BaseDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Mocked Correct Name')
    end
  end
end
