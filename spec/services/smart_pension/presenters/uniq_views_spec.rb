# frozen_string_literal: true

require_relative '../../../spec_helper'
require_relative '../../../../smart_pension/presenters/uniq_views'
require_relative '../../../../smart_pension/query_objects/result_entry'
require_relative '../../../../smart_pension/models/result_entry'

RSpec.describe SmartPension::Presenters::UniqViews do
  include_context 'log_entries'

  let(:sorted_data) do
    result = SmartPension::ResultEntry.new
    log_entries.each { |entry| result << entry }

    SmartPension::QueryObjects::ResultEntry.new(result.uniq_views).call(sort_desc: true)
  end

  it 'generates a string of uniq pages with unique views count' do
    expected = "/path/3 3 unique views\n/path/1 2 unique views\n/path/2 1 unique views"
    expect(described_class.new(sorted_data).show).to eq(expected)
  end
end
