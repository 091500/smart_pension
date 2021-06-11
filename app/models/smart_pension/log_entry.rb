module SmartPension
  class LogEntry
    attr_reader :page_path, :ip_address

    def initialize(page_path = nil, ip_address = nil, object: Ar::LogEntry, validator: Validators::EntryValidator)
      @page_path = page_path
      @ip_address = ip_address
      @object = object
      @validator = validator
    end

    def create
      @object.create(page_path: @page_path, ip_address: @ip_address) if valid?
    end

    def valid?
      @validator.valid?(self)
    end
  end
end
