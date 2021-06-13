require 'test_helper'

module SmartPension
  module Validators
    class IpAddressValidatorTest < ActiveSupport::TestCase
      test '.valid? when item is absent' do
        assert_equal(false, SmartPension::Validators::IpAddressValidator.valid?)
      end

      test '.valid? when item does not respond to :ip_address' do
        assert_equal(false, SmartPension::Validators::IpAddressValidator.valid?('test'))
      end

      test '.valid? when ip_address absent' do
        item = MiniTest::Mock.new
        item.expect(:ip_address, '')

        assert_equal(false, SmartPension::Validators::IpAddressValidator.valid?(item))
        item.verify
      end

      test '.valid? when ip_address does not match pattern' do
        item = MiniTest::Mock.new
        item.expect(:ip_address, 'test')

        assert_equal(false, SmartPension::Validators::IpAddressValidator.valid?(item))
        item.verify
      end

      test '.valid? when ip_address matches pattern' do
        item = MiniTest::Mock.new
        item.expect(:ip_address, '1.2.3.4')

        assert SmartPension::Validators::IpAddressValidator.valid?(item)
        item.verify
      end
    end
  end
end
