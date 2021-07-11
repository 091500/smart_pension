# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/autorun'
require_relative '../../../log_parser/entities/log_entry'

module LogParser
  module Entities
    class LogEntryTest < Minitest::Test
      def test_initialize
        assert LogEntry.new(:page_path, :ip_address)
      end

      def test_valid_when_valid
        validator_page_path = MiniTest::Mock.new
        validator_page_path.expect(:valid?, true, [Symbol])

        validator_ip_address = MiniTest::Mock.new
        validator_ip_address.expect(:valid?, true, [Symbol])

        inst =
          LogEntry.new(
            :page_path,
            :ip_address,
            validators: { page_path: validator_page_path, ip_address: validator_ip_address }
          )

        assert inst.valid?
        validator_page_path.verify
        validator_ip_address.verify
      end

      def test_valid_when_invalid
        validator_page_path = MiniTest::Mock.new
        validator_page_path.expect(:valid?, true, [Symbol])

        validator_ip_address = MiniTest::Mock.new
        validator_ip_address.expect(:valid?, false, [Symbol])

        inst =
          LogEntry.new(
            :page_path,
            :ip_address,
            validators: { page_path: validator_page_path, ip_address: validator_ip_address }
          )

        assert_equal(false, inst.valid?)
        validator_page_path.verify
        validator_ip_address.verify
      end
    end
  end
end
