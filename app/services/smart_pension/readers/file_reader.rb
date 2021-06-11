module SmartPension
  module Readers
    class FileReader < BaseReader
      def initialize(file_path:, file_class: File, log_entry_class: LogEntry)
        @file_path = file_path
        @file_class = file_class
        @log_entry_class = log_entry_class
      end

      def each
        result = []

        @file_class.open(@file_path,'r').each do |line|
          page_path, ip_address = line.split(' ')
          result << @log_entry_class.new(page_path, ip_address)
        end

        result
      end

      def each_valid
        each.select(&:valid?)
      end
    end
  end
end
