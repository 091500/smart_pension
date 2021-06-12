module SmartPension
  module Readers
    class BaseReader
      def each
        raise 'Not Implemented'
      end

      def each_valid
        each.select(&:valid?)
      end
    end
  end
end
