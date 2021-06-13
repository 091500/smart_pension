require 'test_helper'

module SmartPension
  module Validators
    class EntryTest < ActiveSupport::TestCase
      test '.valid? when not all validators pass' do
        item = OpenStruct.new(page_path: '/test')
        assert_equal(false, Entry.valid?(item))
      end

      test '.valid? when all validators pass' do
        item = OpenStruct.new(page_path: '/test', ip_address: '1.2.3.4')
        assert Entry.valid?(item)
      end
    end
  end
end
