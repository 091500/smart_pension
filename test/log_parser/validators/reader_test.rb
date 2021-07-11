# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/autorun'
require_relative '../../../log_parser/validators/reader'

module LogParser
  module Validators
    class ReaderTest < Minitest::Test
      def test_valid_when_reader_is_file_reader
        file_reader_validator_class = MiniTest::Mock.new
        file_reader_validator_class.expect(:valid?, true, [:path])

        file_reader_class = MiniTest::Mock.new

        reader = MiniTest::Mock.new
        reader.expect(:is_a?, true, [MiniTest::Mock])

        assert Reader.valid?(
          reader, :path,
          file_reader_class: file_reader_class,
          validators: {
            file_reader: file_reader_validator_class
          }
        )

        file_reader_validator_class.verify
        reader.verify
      end

      def test_valid_when_reader_is_not_valid
        file_reader_validator_class = MiniTest::Mock.new
        file_reader_class = MiniTest::Mock.new

        reader = MiniTest::Mock.new
        reader.expect(:is_a?, false, [MiniTest::Mock])

        assert_equal(
          false,
          Reader.valid?(
            reader, :path,
            file_reader_class: file_reader_class,
            validators: {
              file_reader: file_reader_validator_class
            }
          )
        )

        file_reader_validator_class.verify
        reader.verify
      end
    end
  end
end
