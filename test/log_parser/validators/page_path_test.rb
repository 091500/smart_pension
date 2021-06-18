# frozen_string_literal: true

require_relative '../../test_helper'
require 'minitest/autorun'
require_relative '../../../log_parser/validators/page_path'

module LogParser
  module Validators
    class PagePathTest < Minitest::Test
      def test_valid_when_item_is_absent
        assert_equal(false, PagePath.valid?)
      end

      def test_valid_when_item_does_not_respond_to_page_path
        assert_equal(false, PagePath.valid?('test'))
      end

      def test_valid_when_page_path_absent
        item = MiniTest::Mock.new
        item.expect(:page_path, '')

        assert_equal(false, PagePath.valid?(item))
        item.verify
      end

      def test_valid_when_page_path_does_not_match_pattern
        item = MiniTest::Mock.new
        item.expect(:page_path, 'test')

        assert_equal(false, PagePath.valid?(item))
        item.verify
      end

      def test_valid_when_page_path_matches_pattern
        item = MiniTest::Mock.new
        item.expect(:page_path, '/test')

        assert PagePath.valid?(item)
        item.verify
      end
    end
  end
end
