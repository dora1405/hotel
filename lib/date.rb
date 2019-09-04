require 'date'


module HotelSystem
  class Date
    attr_reader :check_in, :check_out
    
    def initialize(check_in, check_out)
      @check_in = check_in
      @check_out = check_out
      
    end
    
    # Date.new()
    
    
  end
end