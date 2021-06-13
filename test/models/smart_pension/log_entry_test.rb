require 'test_helper'

module SmartPension
  class LogEntryTest < ActiveSupport::TestCase
    test '#initialize' do
      validator = MiniTest::Mock.new

      inst = LogEntry.new(:page_path, :ip_address, validator: validator)

      assert_equal :page_path, inst.page_path
      assert_equal :ip_address, inst.ip_address
    end

    test '#valid? when valid' do
      validator = MiniTest::Mock.new
      validator.expect(:valid?, true, [LogEntry])

      inst = LogEntry.new(:page_path, :ip_address, validator: validator)

      assert inst.valid?
      validator.verify
    end

    test '#valid? when invalid' do
      validator = MiniTest::Mock.new
      validator.expect(:valid?, false, [LogEntry])

      inst = LogEntry.new(:page_path, :ip_address, validator: validator)

      assert_equal(false, inst.valid?)
      validator.verify
    end
  end
end
