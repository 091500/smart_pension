require 'spec_helper'

RSpec.describe SmartPension::ResultEntry do
  subject { described_class.new }
  let(:log_entries) do
    [
      SmartPension::LogEntry.new('/path/1', '1.2.3.4'),
      SmartPension::LogEntry.new('/path/2', '1.2.3.4'),
      SmartPension::LogEntry.new('/path/1', '1.2.3.4'),
      SmartPension::LogEntry.new('/path/1', '1.2.3.5'),
    ]
  end

  context 'without items' do
    it 'returns empty hash' do
      expect(subject.data).to eq({})
    end
  end

  context 'with items' do
    it 'returns data structure' do
      log_entries.each { |entry| subject << entry }

      expect(subject.data).to eq({ '/path/1' => %w[1.2.3.4 1.2.3.4 1.2.3.5], '/path/2' => %w[1.2.3.4] })
    end

    it 'returns data structure of uniq_pages' do
      log_entries.each { |entry| subject << entry }

      expect(subject.uniq_pages).to eq({ '/path/1' => %w[1.2.3.4 1.2.3.4 1.2.3.5], '/path/2' => %w[1.2.3.4] })
    end

    it 'returns data structure of uniq_views' do
      log_entries.each { |entry| subject << entry }

      expect(subject.uniq_views).to eq({ '/path/1' => %w[1.2.3.4 1.2.3.5], '/path/2' => %w[1.2.3.4] })
    end
  end
end
