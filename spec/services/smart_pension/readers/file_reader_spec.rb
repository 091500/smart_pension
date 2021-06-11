require 'spec_helper'

RSpec.describe SmartPension::Readers::FileReader do
  let(:file_path) { Rails.root.join(*%w[spec fixtures files webserver.example.log]) }

  context 'file exists' do
    it 'generates an array of valid LogEntry objects' do
      result = described_class.new(file_path: file_path).each { |log_entry| log_entry }

      expect(result).to be_a(Array)
      expect(result.size).to eq(13)
      expect(result.first).to be_an_instance_of(SmartPension::LogEntry)
    end
  end

  context 'file absent' do
    it 'generates error message' do
      expect { described_class.new(file_path: nil).each { |log_entry| log_entry } }.to raise_error
    end
  end
end
