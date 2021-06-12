module SmartPension
  module Presenters
    class UniqPages < Base
      def show
        @data.map { |key, value| "#{key} #{value.count} visits" }.join("\n")
      end
    end
  end
end
