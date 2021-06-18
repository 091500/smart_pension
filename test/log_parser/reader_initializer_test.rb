# frozen_string_literal: true

require_relative '../test_helper'
require 'minitest/autorun'
require_relative '../../log_parser/reader_initializer'

module LogParser
  class ReaderInitializerTest < Minitest::Test
    def test_each_when_invalid_reader
      instance = ReaderInitializer.new('bad', file_reader_class: MiniTest::Mock.new)

      assert_raises(RuntimeError, 'Reader is not supported for bad') { instance.each { |entry| entry } }
    end

    def test_each_when_valid_reader
      reader = MiniTest::Mock.new
      reader.expect(:new, reader, [{ file_path: 'webserver.log' }])
      reader.expect(:valid_entries, reader)
      reader.expect(:each, true) do |&block|
        block.call(:entry)
      end

      instance = ReaderInitializer.new('webserver.log', file_reader_class: reader)

      assert_equal(true, instance.each { |entry| entry })
      reader.verify
    end
  end
end
