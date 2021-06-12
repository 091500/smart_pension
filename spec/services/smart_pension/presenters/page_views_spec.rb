require 'spec_helper'
require 'shared/log_entries_shared_context.rb'

RSpec.describe SmartPension::Presenters::UniqPages do
  include_context 'log_entries'

  let(:data) do
    result = SmartPension::ResultEntry.new
    log_entries.each { |entry| result << entry }
    result.uniq_pages
  end

  it 'generates a string of uniq pages with total visit count' do
    expect(described_class.new(data).show).to eq("/path/1 3 visits\n, /path/2 1 visits\n")
  end
end
