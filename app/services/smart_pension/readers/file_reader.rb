module SmartPension
  module Readers
    class FileReader < BaseReader
      def initialize(file_path:)
        @file_path = file_path
      end
    end
  end
end
