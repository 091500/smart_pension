require 'test_helper'

module SmartPension
  class ReaderInitializerTest < ActiveSupport::TestCase
    test '#each when invalid reader' do
      instance = ReaderInitializer.new('bad', file_reader_class: MiniTest::Mock.new)

      assert_raises(RuntimeError, 'Reader is not supported for bad') { instance.each { |entry| entry } }
    end

    test '#each when valid reader' do
      reader = MiniTest::Mock.new
      reader.expect(:new, reader, [{ file_path: 'webserver.log' }])
      reader.expect(:valid_entries, reader)
      reader.expect(:each, true) do |&block|
        block.call(:entry)
      end

      instance = ReaderInitializer.new('webserver.log', file_reader_class: reader)

      assert_equal(true, instance.each { |entry| entry })
      reader.verify
    end
  end
end
