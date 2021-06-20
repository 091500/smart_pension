# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/autorun'
require_relative '../../../log_parser/validators/error'

module LogParser
  module Validators
    class ErrorTest < Minitest::Test
      def test_initialize
        assert Error.new
      end

      def test_missing_file_path
        reader = MiniTest::Mock.new
        reader.expect(:reader, :reader)

        assert Error.new(nil, reader).validate.include?('Missing file path')
      end

      def test_reader_not_supported
        assert Error.new(:path).validate.include?('Reader is not supported')
      end

      def test_reader_failed
        reader = MiniTest::Mock.new
        reader.expect(:reader, :reader)

        reader_validator = MiniTest::Mock.new
        reader_validator.expect(:valid?, false, [:reader, :path])

        assert Error.new(:path, reader, reader_validator_class: reader_validator).validate.include?('File Reader failed')
      end
    end
  end
end
