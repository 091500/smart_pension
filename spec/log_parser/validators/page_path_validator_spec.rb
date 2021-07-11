# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../log_parser/validators/page_path'

RSpec.describe LogParser::Validators::PagePath do
  context '.valid?' do
    context 'item is nil' do
      it 'returns false' do
        expect(described_class.valid?).to be_falsey
      end
    end

    context 'item page_path is empty' do
      it 'returns false' do
        expect(described_class.valid?('')).to be_falsey
      end
    end

    context 'item page_path does not match pattern' do
      it 'returns false' do
        expect(described_class.valid?('badpath')).to be_falsey
        expect(described_class.valid?('\badpath')).to be_falsey
        expect(described_class.valid?('123/badpath')).to be_falsey
      end
    end

    context 'item ip_address matches pattern' do
      it 'returns false' do
        expect(described_class.valid?('/index')).to be_truthy
        expect(described_class.valid?('/about/index')).to be_truthy
        expect(described_class.valid?('/index/1')).to be_truthy
        expect(described_class.valid?('/index/1-test')).to be_truthy
      end
    end
  end
end
