# frozen_string_literal: true

require 'test_helper'

module SmartPension
  class LogParserTest < ActiveSupport::TestCase
    test '#initialize' do
      assert LogParser.new
    end

    test '#parse missing argument' do
      assert('Missing argument', LogParser.new.parse)
    end

    test '#parse when error raised' do
      assert_equal('There was an error: Reader is not supported for foo', LogParser.new.parse('foo'))
    end

    test '#parse when no error' do
      file_path = Rails.root.join('spec', 'fixtures', 'files', 'webserver.log').to_s

      reader_initializer = MiniTest::Mock.new
      reader_initializer.expect(:new, reader_initializer, [file_path])
      reader_initializer.expect(:each, true) { |&block| block.call(:log_entry) }

      result_entry = MiniTest::Mock.new
      result_entry.expect(:new, result_entry)
      result_entry.expect(:<<, result_entry, [:log_entry])
      result_entry.expect(:uniq_pages, :unique_pages)
      result_entry.expect(:uniq_views, :uniq_views)

      query_object = MiniTest::Mock.new
      query_object.expect(:new, query_object, [:unique_pages])
      query_object.expect(:new, query_object, [:uniq_views])
      query_object.expect(:call, :sorted_unique_pages, [{ sort_desc: true }])
      query_object.expect(:call, :sorted_unique_views, [{ sort_desc: true }])

      uniq_pages_presenter = MiniTest::Mock.new
      uniq_pages_presenter.expect(:new, uniq_pages_presenter, [:sorted_unique_pages])
      uniq_pages_presenter.expect(:show, 'show uniq pages')

      uniq_views_presenter = MiniTest::Mock.new
      uniq_views_presenter.expect(:new, uniq_views_presenter, [:sorted_unique_views])
      uniq_views_presenter.expect(:show, 'show uniq views')

      expected = <<~EXP
        Page views, sort order desc:
        show uniq pages

        Uniq page visits, sort order desc:
        show uniq views
      EXP

      instance = LogParser.new(
        reader_initializer_class: reader_initializer,
        result_entry_class: result_entry,
        query_object_class: query_object,
        uniq_pages_presenter_class: uniq_pages_presenter,
        uniq_views_presenter_class: uniq_views_presenter
      )

      assert_equal(expected.strip, instance.parse(file_path))
      reader_initializer.verify
      result_entry.verify
      query_object.verify
      uniq_pages_presenter.verify
      uniq_views_presenter.verify
    end
  end
end
