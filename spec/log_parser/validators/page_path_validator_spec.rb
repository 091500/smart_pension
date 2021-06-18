# frozen_string_literal: true

require 'ostruct'
require_relative '../../spec_helper'
require_relative '../../../log_parser/validators/page_path'

RSpec.describe LogParser::Validators::PagePath do
  context '.valid?' do
    context 'item is nil' do
      let(:item) { nil }

      it 'returns false' do
        expect(described_class.valid?(item)).to be_falsey
      end
    end

    context 'item does not respond to :page_path' do
      let(:item) { {} }

      it 'returns false' do
        expect(described_class.valid?(item)).to be_falsey
      end
    end

    context 'item page_path is empty' do
      let(:item) { OpenStruct.new(page_path: '') }

      it 'returns false' do
        expect(described_class.valid?(item)).to be_falsey
      end
    end

    context 'item page_path does not match pattern' do
      let(:item_one) { OpenStruct.new(page_path: 'badpath') }
      let(:item_two) { OpenStruct.new(page_path: '\badpath') }
      let(:item_three) { OpenStruct.new(page_path: '123/badpath') }

      it 'returns false' do
        expect(described_class.valid?(item_one)).to be_falsey
        expect(described_class.valid?(item_two)).to be_falsey
        expect(described_class.valid?(item_three)).to be_falsey
      end
    end

    context 'item ip_address matches pattern' do
      let(:item_one) { OpenStruct.new(page_path: '/index') }
      let(:item_two) { OpenStruct.new(page_path: '/about/index') }
      let(:item_three) { OpenStruct.new(page_path: '/index/1') }
      let(:item_four) { OpenStruct.new(page_path: '/index/1-test') }

      it 'returns false' do
        expect(described_class.valid?(item_one)).to be_truthy
        expect(described_class.valid?(item_two)).to be_truthy
        expect(described_class.valid?(item_three)).to be_truthy
        expect(described_class.valid?(item_four)).to be_truthy
      end
    end
  end
end
