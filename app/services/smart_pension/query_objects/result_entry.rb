module SmartPension
  module QueryObjects
    class ResultEntry
      def initialize(initial_scope)
        @initial_scope = initial_scope
      end

      def call(params)
        raise 'Not implemented'
      end
    end
  end
end
