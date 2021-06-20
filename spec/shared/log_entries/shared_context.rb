# frozen_string_literal: true

require_relative '../../../log_parser/entities/log_entry'

RSpec.shared_context 'log_entries' do
  let(:log_entries) do
    [
      LogParser::Entities::LogEntry.new('/path/1', '1.2.3.4'),
      LogParser::Entities::LogEntry.new('/path/2', '1.2.3.4'),
      LogParser::Entities::LogEntry.new('/path/1', '1.2.3.4'),
      LogParser::Entities::LogEntry.new('/path/1', '1.2.3.5'),
      LogParser::Entities::LogEntry.new('/path/3', '1.2.3.4'),
      LogParser::Entities::LogEntry.new('/path/3', '1.2.3.5'),
      LogParser::Entities::LogEntry.new('/path/3', '1.2.3.6')
    ]
  end
end
