# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../log_parser/presenters/uniq_pages'
require_relative '../../../log_parser/query_objects/result_entry'
require_relative '../../../log_parser/entities/result_entry'

RSpec.describe LogParser::Presenters::UniqPages do
  include_context 'log_entries'

  let(:data) do
    result = LogParser::Entities::ResultEntry.new
    log_entries.each { |entry| result << entry }

    LogParser::QueryObjects::ResultEntry.new(result.uniq_pages).call(sort_desc: true)
  end

  it 'generates a string of uniq pages with total visit count' do
    expect(described_class.new(data).show).to eq("/path/3 3 visits\n/path/1 3 visits\n/path/2 1 visits")
  end
end
