# frozen_string_literal: true

require 'ostruct'
require_relative '../../../spec_helper'
require_relative '../../../../smart_pension/validators/entry'

RSpec.describe SmartPension::Validators::Entry do
  context '.valid?' do
    context 'when not all validations passed' do
      let(:item_one) { OpenStruct.new(page_path: 'badpath', ip_address: '1.2.3.4') }
      let(:item_two) { OpenStruct.new(page_path: '/goodpath', ip_address: '1.2') }
      let(:item_three) { nil }
      let(:item_four) { '' }

      it 'returns false' do
        expect(described_class.valid?(item_one)).to be_falsey
        expect(described_class.valid?(item_two)).to be_falsey
        expect(described_class.valid?(item_three)).to be_falsey
        expect(described_class.valid?(item_four)).to be_falsey
      end
    end

    context 'when all validations passed' do
      let(:item_one) { OpenStruct.new(page_path: '/good', ip_address: '1.2.3.4') }

      it 'returns true' do
        expect(described_class.valid?(item_one)).to be_truthy
      end
    end
  end
end
