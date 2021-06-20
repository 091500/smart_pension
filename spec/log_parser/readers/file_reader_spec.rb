# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../log_parser/readers/file_reader'
require_relative '../../../log_parser/entities/result_entry'

RSpec.describe LogParser::Readers::FileReader do
  let(:file_path) { File.join(File.dirname(__FILE__), '../../fixtures/webserver.log').to_s }
  let(:bad_name_file_path) { File.join(File.dirname(__FILE__), '../../fixtures/webserver.example.log').to_s }
  let(:bad_name_two_file_path) { File.join(File.dirname(__FILE__), '../../fixtures/bad_webserver.log').to_s }

  context 'file exists' do
    it 'generates an array of valid LogEntry objects' do
      result = described_class.new(file_path: file_path).valid_entries.each { |log_entry| log_entry }

      expect(result).to be_a(Array)
      expect(result.size).to eq(13)
      expect(result.first).to be_an_instance_of(LogParser::Entities::LogEntry)
    end
  end

  context 'file absent' do
    it 'generates error message' do
      expect do
        described_class.new(file_path: nil).entries.each { |log_entry| log_entry }
      end.to raise_error(TypeError)
    end
  end

  context 'file name is not webserver.log' do
    it 'generates an array of valid LogEntry objects' do
      result = described_class.new(file_path: bad_name_file_path).valid_entries.each { |log_entry| log_entry }

      expect(result).to be_a(Array)
      expect(result.size).to eq(1)
      expect(result.first).to be_an_instance_of(LogParser::Entities::LogEntry)
    end
  end
end
