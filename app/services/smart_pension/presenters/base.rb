module SmartPension
  module Presenters
    class Base
      def initialize(data = {})
        @data = data
      end

      def show
        raise 'Not implemented'
      end
    end
  end
end
