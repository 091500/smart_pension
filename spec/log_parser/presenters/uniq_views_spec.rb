# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../log_parser/presenters/uniq_views'
require_relative '../../../log_parser/query_objects/result_entry'
require_relative '../../../log_parser/entities/result_entry'

RSpec.describe LogParser::Presenters::UniqViews do
  include_context 'log_entries'

  let(:sorted_data) do
    result = LogParser::Entities::ResultEntry.new
    log_entries.each { |entry| result << entry }

    LogParser::QueryObjects::ResultEntry.new(result.uniq_views).call(sort_desc: true)
  end

  it 'generates a string of uniq pages with unique views count' do
    expected = "/path/3 3 unique views\n/path/1 2 unique views\n/path/2 1 unique views"
    expect(described_class.new(sorted_data).show).to eq(expected)
  end
end
