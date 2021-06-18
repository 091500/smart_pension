# frozen_string_literal: true

require_relative '../../test_helper'
require 'ostruct'
require 'minitest/autorun'
require_relative '../../../log_parser/entities/result_entry'

module LogParser
  module Entities
    class ResultEntryTest < Minitest::Test
      def test_initialize
        assert ResultEntry.new
      end

      def test_when_passed_invalid
        instance = ResultEntry.new
        instance << ''
        instance << OpenStruct.new
        instance << OpenStruct.new(page_path: '/page')
        instance << OpenStruct.new(ip_address: '1.2.3.4')
        instance << OpenStruct.new(page_path: '/page', ip_address: '1.2.3.4', valid?: false)

        assert_equal({}, instance.uniq_pages)
        assert_equal({}, instance.uniq_views)
      end

      def test_when_passed_valid
        instance = ResultEntry.new
        instance << OpenStruct.new(page_path: '/page', ip_address: '1.2.3.4', valid?: true)
        instance << OpenStruct.new(page_path: '/page', ip_address: '1.2.3.5', valid?: true)
        instance << OpenStruct.new(page_path: '/page', ip_address: '1.2.3.5', valid?: true)
        instance << OpenStruct.new(page_path: '/test', ip_address: '1.2.3.4', valid?: true)

        assert_equal({ '/page' => %w[1.2.3.4 1.2.3.5 1.2.3.5], '/test' => %w[1.2.3.4] }, instance.uniq_pages)
        assert_equal({ '/page' => %w[1.2.3.4 1.2.3.5], '/test' => %w[1.2.3.4] }, instance.uniq_views)
      end
    end
  end
end
