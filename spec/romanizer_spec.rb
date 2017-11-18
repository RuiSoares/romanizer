require 'romanizer'
require 'errors'

describe Romanizer do
  describe '#parse' do
    context 'when given a non integer' do
      it 'sends an error message' do
        expect {
          Romanizer.new.parse('not a number')
        }.to raise_error(RomanizerErrors::NotANumberError)
      end
    end

    context 'when given a number bigger than 10000' do
      it 'sends an error message' do
        expect {
          Romanizer.new.parse(10001)
        }.to raise_error(RomanizerErrors::OutOfRangeError)
      end
    end

    context 'when given a valid number:' do
      it '0 returns nulla' do
        expect( Romanizer.new.parse(0) ).to eq('nulla')
      end

      it '1 returns I' do
        expect( Romanizer.new.parse(1) ).to eq('I')
      end

      it '8 returns VIII' do
        expect( Romanizer.new.parse(8) ).to eq('VIII')
      end

      it '14 returns XIV' do
        expect( Romanizer.new.parse(14) ).to eq('XIV')
      end

      it '149 returns CXLIX' do
        expect( Romanizer.new.parse(149) ).to eq('CXLIX')
      end

      it '300 returns CCC' do
        expect( Romanizer.new.parse(300) ).to eq('CCC')
      end

      it '1000 returns M' do
        expect( Romanizer.new.parse(1000) ).to eq('M')
      end

      it '4949 returns M_VCMXLIX' do
        expect( Romanizer.new.parse(4949) ).to eq('M_VCMXLIX')
      end

      it '5000 returns _V' do
        expect( Romanizer.new.parse(5000) ).to eq('_V')
      end

      it '9999 returns M_XCMXCIX' do
        expect( Romanizer.new.parse(9999) ).to eq('M_XCMXCIX')
      end

      it '10000 returns _X' do
        expect( Romanizer.new.parse(10000) ).to eq('_X')
      end
    end
  end
end
