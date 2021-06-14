# frozen_string_literal: true

module SmartPension
  module Presenters
    class UniqViews < Base
      def show
        @data.map { |key, value| "#{key} #{value.count} unique views" }.join("\n")
      end
    end
  end
end
