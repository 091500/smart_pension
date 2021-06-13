require 'spec_helper'
require 'ostruct'

RSpec.describe SmartPension::Validators::IpAddress do
  context '.valid?' do
    context 'item is nil' do
      let(:item) { nil }

      it 'returns false' do
        expect(described_class.valid?(item)).to be_falsey
      end
    end

    context 'item does not respond to :ip_address' do
      let(:item) { {} }

      it 'returns false' do
        expect(described_class.valid?(item)).to be_falsey
      end
    end

    context 'item ip_address is empty' do
      let(:item) { OpenStruct.new(ip_address: '') }

      it 'returns false' do
        expect(described_class.valid?(item)).to be_falsey
      end
    end

    context 'item ip_address does not match pattern' do
      let(:item_one) { OpenStruct.new(ip_address: '1.2.3') }
      let(:item_two) { OpenStruct.new(ip_address: '1.2.3.a') }
      let(:item_three) { OpenStruct.new(ip_address: '1234.2.3.4') }
      let(:item_four) { OpenStruct.new(ip_address: '1-2-3-4') }
      let(:item_five) { OpenStruct.new(ip_address: '1.2.3.4.5') }

      it 'returns false' do
        expect(described_class.valid?(item_one)).to be_falsey
        expect(described_class.valid?(item_two)).to be_falsey
        expect(described_class.valid?(item_three)).to be_falsey
        expect(described_class.valid?(item_four)).to be_falsey
        expect(described_class.valid?(item_five)).to be_falsey
      end
    end

    context 'item ip_address matches pattern' do
      let(:item_one) { OpenStruct.new(ip_address: '1.2.3.4') }
      let(:item_two) { OpenStruct.new(ip_address: '999.2.3.4') }
      let(:item_three) { OpenStruct.new(ip_address: '999.999.999.999') }
      let(:item_four) { OpenStruct.new(ip_address: '0.0.0.0') }

      it 'returns false' do
        expect(described_class.valid?(item_one)).to be_truthy
        expect(described_class.valid?(item_two)).to be_truthy
        expect(described_class.valid?(item_three)).to be_truthy
        expect(described_class.valid?(item_four)).to be_truthy
      end
    end
  end
end
