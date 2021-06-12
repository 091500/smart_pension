require 'spec_helper'
require 'shared/log_entries_shared_context.rb'

RSpec.describe SmartPension::Presenters::UniqViews do
  include_context 'log_entries'

  let(:data) do
    result = SmartPension::ResultEntry.new
    log_entries.each { |entry| result << entry }
    result.uniq_views
  end

  it 'generates a string of uniq pages with unique views count' do
    expect(described_class.new(data).show).to eq("/path/1 2 unique views\n, /path/2 1 unique views\n")
  end
end
