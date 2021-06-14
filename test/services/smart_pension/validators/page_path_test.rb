# frozen_string_literal: true

require 'test_helper'

module SmartPension
  module Validators
    class PagePathTest < ActiveSupport::TestCase
      test '.valid? when item is absent' do
        assert_equal(false, PagePath.valid?)
      end

      test '.valid? when item does not respond to :page_path' do
        assert_equal(false, PagePath.valid?('test'))
      end

      test '.valid? when page path absent' do
        item = MiniTest::Mock.new
        item.expect(:page_path, '')

        assert_equal(false, PagePath.valid?(item))
        item.verify
      end

      test '.valid? when page path does not start with /' do
        item = MiniTest::Mock.new
        item.expect(:page_path, 'test')

        assert_equal(false, PagePath.valid?(item))
        item.verify
      end

      test '.valid? when page path starts with /' do
        item = MiniTest::Mock.new
        item.expect(:page_path, '/test')

        assert PagePath.valid?(item)
        item.verify
      end
    end
  end
end
