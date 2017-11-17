require 'spec_helper'
require 'romanizer'

describe Romanizer do
  describe '#parse' do
    context 'when given a non integer' do
      it 'sends an error message' do
        expect { Romanizer.new.parse('not a number') }.to raise_error(ArgumentError)
      end
    end

    context 'when given the number 1' do
      it 'returns I' do
        expect( Romanizer.new.parse(1) ).to eq('I')
      end
    end
  end
end
