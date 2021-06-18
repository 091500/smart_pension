# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/autorun'
require_relative '../../../log_parser/readers/base'

module LogParser
  module Readers
    class BaseTest < Minitest::Test
      def test_initialize
        assert Base.new
      end

      def test_valid_entries
        assert_equal([], Base.new.valid_entries)
      end
    end
  end
end
