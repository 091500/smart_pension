require 'spec_helper'

RSpec.describe SmartPension::LogEntry do
  context 'when page_path and ip_address are present' do
    it 'creates a new record' do
      expect { described_class.new('page_path', 'ip_address').create }.to change { SmartPension::Ar::LogEntry.count }.by(1)
    end
  end

  context 'when page_path is absent' do
    it 'does not create new record' do
      expect { described_class.new(nil, 'ip_address').create }.not_to change { SmartPension::Ar::LogEntry.count }
    end
  end

  context 'when ip_address is absent' do
    it 'does not create new record' do
      expect { described_class.new('page_path', nil).create }.not_to change { SmartPension::Ar::LogEntry.count }
    end
  end
end
