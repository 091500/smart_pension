# frozen_string_literal: true

require_relative '../../../test_helper'
require 'minitest/autorun'
require_relative '../../../../smart_pension/readers/file_reader'

module SmartPension
  module Readers
    class FileReaderTest < Minitest::Test
      def test_initialize_with_bad_name
        assert_raises(StandardError, 'Bad file name:') { FileReader.new(file_path: 'bad.txt') }
      end

      def test_valid_entries
        file_name = FileReader::ALLOWED_FILE_NAMES.first
        file_class = MiniTest::Mock.new
        file_class.expect(:open, file_class, [file_name, 'r'])
        file_class.expect(:basename, file_name, [file_name])
        file_class.expect(:each, true) do |&block|
          block.call('/test 1.2.3.4')
        end

        log_entry_class = MiniTest::Mock.new
        log_entry_class.expect(:new, log_entry_class, ['/test', '1.2.3.4'])
        log_entry_class.expect(:valid?, true)

        instance = FileReader.new(
          file_path: file_name,
          file_class: file_class,
          log_entry_class: log_entry_class
        )

        assert_equal(1, instance.valid_entries.count)
        file_class.verify
        log_entry_class.verify
      end
    end
  end
end
