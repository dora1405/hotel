


module HotelSystem
  class BookingManager
    attr_reader :name, :check_in, :check_out, :all_rooms
    
    def initialize(
      name:,
      check_in:,
      check_out:,
      all_rooms: {1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [], 10 => [], 11 => [], 12 => [], 13 => [], 14 => [], 15 => [], 16 => [], 17 => [], 18 => [], 19 => [], 20 => []}
    )
    @name = name
    @check_in = check_in
    @check_out = check_out
    @all_rooms = all_rooms
    end
  
  
  
  
  end
end