module SmartPension
  class ResultEntry
    attr_reader :data
    alias_method :uniq_pages, :data

    def initialize
      @data = {}
    end

    def <<(log_entry)
      return unless log_entry.respond_to?(:valid?)
      return unless log_entry.valid?

      @data[log_entry.page_path] ||= []
      @data[log_entry.page_path] << log_entry.ip_address
    end

    def uniq_views
      @data.each_with_object({}) { |(name, addresses), hash| hash[name] = addresses.uniq }
    end
  end
end
