# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../log_parser/validators/ip_address'

RSpec.describe LogParser::Validators::IpAddress do
  context '.valid?' do
    context 'item is nil' do
      it 'returns false' do
        expect(described_class.valid?).to be_falsey
      end
    end

    context 'item ip_address is empty' do
      it 'returns false' do
        expect(described_class.valid?('')).to be_falsey
      end
    end

    context 'item ip_address does not match pattern' do
      it 'returns false' do
        expect(described_class.valid?('1.2.3')).to be_falsey
        expect(described_class.valid?('1.2.3.a')).to be_falsey
        expect(described_class.valid?('1234.2.3.4')).to be_falsey
        expect(described_class.valid?('1-2-3-4')).to be_falsey
        expect(described_class.valid?('1.2.3.4.5')).to be_falsey
      end
    end

    context 'item ip_address matches pattern' do
      it 'returns false' do
        expect(described_class.valid?('1.2.3.4')).to be_truthy
        expect(described_class.valid?('999.2.3.4')).to be_truthy
        expect(described_class.valid?('999.999.999.999')).to be_truthy
        expect(described_class.valid?('0.0.0.0')).to be_truthy
      end
    end
  end
end
