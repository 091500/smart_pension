# frozen_string_literal: true

require 'ostruct'
require_relative '../../spec_helper'
require_relative '../../../smart_pension/reader_initializer'
require_relative '../../../smart_pension/models/log_entry'

RSpec.describe SmartPension::ReaderInitializer do
  let(:file_path) { File.join(File.dirname(__FILE__), '../../files/webserver.log').to_s }

  context 'when reader is not supported' do
    it 'raises an error on #each' do
      expect { described_class.new('test.csv').each }.to raise_error('Reader is not supported for test.csv')
    end
  end

  context 'when reader is supported' do
    it 'yields valid LogEntry instances on #each' do
      result = described_class.new(file_path).each { |entry| entry }

      expect(result).to be_a(Array)
      expect(result.size).to eq(13)
      expect(result).to all(be_kind_of(SmartPension::LogEntry))
    end
  end
end
