# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/autorun'
require_relative '../../../log_parser/entities/log_entry'

module LogParser
  module Entities
    class LogEntryTest < Minitest::Test
      def test_initialize
        validator = MiniTest::Mock.new

        inst = LogEntry.new(:page_path, :ip_address, validator: validator)

        assert_equal :page_path, inst.page_path
        assert_equal :ip_address, inst.ip_address
      end

      def test_valid_when_valid
        validator = MiniTest::Mock.new
        validator.expect(:valid?, true, [LogEntry])

        inst = LogEntry.new(:page_path, :ip_address, validator: validator)

        assert inst.valid?
        validator.verify
      end

      def test_valid_when_invalid
        validator = MiniTest::Mock.new
        validator.expect(:valid?, false, [LogEntry])

        inst = LogEntry.new(:page_path, :ip_address, validator: validator)

        assert_equal(false, inst.valid?)
        validator.verify
      end
    end
  end
end
