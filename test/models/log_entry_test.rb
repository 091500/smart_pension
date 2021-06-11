require 'test_helper'
require 'ostruct'

class LogEntryTest < ActiveSupport::TestCase
  test '#initialize' do
    inst = LogEntry.new(page_path: :page_path, ip_address: :ip_address, validator: :validator)

    assert_equal :page_path, inst.page_path
    assert_equal :ip_address, inst.ip_address
  end

  test '#valid?' do
    validator = MiniTest::Mock.new
    validator.expect(:valid?, true, [LogEntry])

    inst = LogEntry.new(page_path: :page_path, ip_address: :ip_address, validator: validator)

    assert inst.valid?
    validator.verify
  end
end
