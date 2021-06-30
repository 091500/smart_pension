# frozen_string_literal: true

require_relative '../../spec_helper'
require_relative '../../../log_parser/presenters/uniq_pages'

RSpec.describe LogParser::Presenters::UniqPages do
  it 'generates a string of uniq pages with total visit count' do
    data = double('Data')
    allow(data).to receive(:map) { ['/path/3 3 visits', '/path/1 1 visits'] }
    allow(data).to receive(:join)

    expect(described_class.new(data).show).to eq("/path/3 3 visits\n/path/1 1 visits")
  end
end
