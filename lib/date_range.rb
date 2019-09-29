


module HotelSystem
  class DateRange
    attr_reader :check_in
    attr_accessor :check_out
    
    def initialize(check_in:, check_out:)
      @check_in = Date.parse(check_in.to_s)
      @check_out = Date.parse(check_out.to_s)
      
    end
    
    def date_checker
      if @check_out < @check_in
        raise ArgumentError, "Invalid check-out date"
      end
    end
    
    
  end
end