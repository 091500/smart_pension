module SmartPension
  module Readers
    class BaseReader
      def entries
        @entries ||= retrieve_entries
      end

      def valid_entries
        entries.select(&:valid?)
      end

      private

      def retrieve_entries
        []
      end
    end
  end
end
