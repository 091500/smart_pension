# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/autorun'
require_relative '../../../log_parser/validators/file_reader'

module LogParser
  module Validators
    class ReaderTest < Minitest::Test
      def test_path_absent
        assert_equal(false, FileReader.valid?)
      end

      def test_path_valid
        assert FileReader.valid?(__FILE__)
      end
    end
  end
end
