# frozen_string_literal: true

require_relative '../../../test_helper'
require 'minitest/autorun'
require 'ostruct'
require_relative '../../../../smart_pension/validators/entry'

module SmartPension
  module Validators
    class EntryTest < Minitest::Test
      def test_valid_when_not_all_validators_pass
        item = OpenStruct.new(page_path: '/test')
        assert_equal(false, Entry.valid?(item))
      end

      def test_valid_when_all_validators_pass
        item = OpenStruct.new(page_path: '/test', ip_address: '1.2.3.4')
        assert Entry.valid?(item)
      end
    end
  end
end
