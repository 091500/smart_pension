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

    test '#create when valid' do
      object = MiniTest::Mock.new
      object.expect(:create, true, [{page_path: :page_path, ip_address: :ip_address}])

      validator = MiniTest::Mock.new
      validator.expect(:valid?, true, [LogEntry])

      inst = LogEntry.new(:page_path, :ip_address, object: object, validator: validator)

      assert inst.create
      object.verify
      validator.verify
    end

    test '#create when invalid' do
      object = MiniTest::Mock.new

      validator = MiniTest::Mock.new
      validator.expect(:valid?, false, [LogEntry])

      inst = LogEntry.new(:page_path, :ip_address, object: object, validator: validator)

      assert_nil inst.create
      object.verify
      validator.verify
    end
  end
end
