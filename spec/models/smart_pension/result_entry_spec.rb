# frozen_string_literal: true

require 'spec_helper'
require 'shared/log_entries_shared_context.rb'

RSpec.describe SmartPension::ResultEntry do
  include_context 'log_entries'

  subject { described_class.new }

  context 'without items' do
    it 'returns empty hash' do
      expect(subject.data).to eq({})
    end
  end

  context 'with items' do
    it 'returns data structure' do
      log_entries.each { |entry| subject << entry }

      expect(subject.data).to eq({
                                   '/path/1' => %w[1.2.3.4 1.2.3.4 1.2.3.5],
                                   '/path/2' => %w[1.2.3.4],
                                   '/path/3' => %w[1.2.3.4 1.2.3.5 1.2.3.6]
                                 })
    end

    it 'returns data structure of uniq_pages' do
      log_entries.each { |entry| subject << entry }

      expect(subject.uniq_pages).to eq({
                                         '/path/1' => %w[1.2.3.4 1.2.3.4 1.2.3.5],
                                         '/path/2' => %w[1.2.3.4],
                                         '/path/3' => %w[1.2.3.4 1.2.3.5 1.2.3.6]
                                       })
    end

    it 'returns data structure of uniq_views' do
      log_entries.each { |entry| subject << entry }

      expect(subject.uniq_views).to eq({
                                         '/path/1' => %w[1.2.3.4 1.2.3.5],
                                         '/path/2' => %w[1.2.3.4],
                                         '/path/3' => %w[1.2.3.4 1.2.3.5 1.2.3.6]
                                       })
    end
  end
end
