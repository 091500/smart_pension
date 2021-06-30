# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../log_parser/presenters/uniq_views'

RSpec.describe LogParser::Presenters::UniqViews do
  it 'generates a string of uniq pages with unique views count' do
    data = double('Data')
    allow(data).to receive(:map) { ['/path/3 3 unique views', '/path/1 2 unique views'] }
    allow(data).to receive(:join)

    expect(described_class.new(data).show).to eq("/path/3 3 unique views\n/path/1 2 unique views")
  end
end
