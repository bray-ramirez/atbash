require './atbash'

RSpec.describe Atbash do
  describe '#initialize' do
    context 'with valid cipher' do
      let(:cipher) { 'xkentilmvazrowgpyfdhqjbusc' }

      it { expect { Atbash.new(cipher) }.to_not raise_error }
    end

    context 'with invalid cipher' do
      let(:duplicate_character) { 'xkentilmvazrowgpyfdhqjbuss' }
      let(:missing_character) { 'xkentilmvazrowgpyfdhqjbus' }

      it { expect { Atbash.new(duplicate_character) }.to raise_error(ArgumentError) }
      it { expect { Atbash.new(missing_character) }.to raise_error(ArgumentError) }
    end
  end

  describe '#decode' do
    context 'basic decoding' do
      let(:cipher) { 'zodvqukgwefbyitmrsplhacxnj' }
      let(:encrypted_text) { 'dzs' }

      it { expect(Atbash.new(cipher).decode(encrypted_text)).to eq 'car' }
    end

    context 'with other characters' do
      let(:cipher) { 'xipmuzfkbrlwotjancqgveshdy' }
      let(:encrypted_text) { 'skd qj qucbjvq?' }

      it { expect(Atbash.new(cipher).decode(encrypted_text)).to eq 'why so serious?' }
    end
  end

end
