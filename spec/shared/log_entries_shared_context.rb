RSpec.shared_context 'log_entries' do
  let(:log_entries) do
    [
      SmartPension::LogEntry.new('/path/1', '1.2.3.4'),
      SmartPension::LogEntry.new('/path/2', '1.2.3.4'),
      SmartPension::LogEntry.new('/path/1', '1.2.3.4'),
      SmartPension::LogEntry.new('/path/1', '1.2.3.5'),
      SmartPension::LogEntry.new('/path/3', '1.2.3.4'),
      SmartPension::LogEntry.new('/path/3', '1.2.3.5'),
      SmartPension::LogEntry.new('/path/3', '1.2.3.6'),
    ]
  end
end
