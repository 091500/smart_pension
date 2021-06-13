require 'test_helper'

module SmartPension
  class LogEntryTest < ActiveSupport::TestCase
    test '#initialize' do
      object = MiniTest::Mock.new
      validator = MiniTest::Mock.new

      inst = LogEntry.new(:page_path, :ip_address, object: object, validator: validator)

      assert_equal :page_path, inst.page_path
      assert_equal :ip_address, inst.ip_address
    end

    test '#valid? when valid' do
      object = MiniTest::Mock.new

      validator = MiniTest::Mock.new
      validator.expect(:valid?, true, [LogEntry])

      inst = LogEntry.new(:page_path, :ip_address, object: object, validator: validator)

      assert inst.valid?
      object.verify
      validator.verify
    end

    test '#valid? when invalid' do
      object = MiniTest::Mock.new

      validator = MiniTest::Mock.new
      validator.expect(:valid?, false, [LogEntry])

      inst = LogEntry.new(:page_path, :ip_address, object: object, validator: validator)

      assert_equal(false, inst.valid?)
      object.verify
      validator.verify
    end
  end
end
