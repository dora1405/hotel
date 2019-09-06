


module HotelSystem
  class BookingManager
    attr_reader :all_rooms
    
    def initialize(
      all_rooms: {1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [], 10 => [], 11 => [], 12 => [], 13 => [], 14 => [], 15 => [], 16 => [], 17 => [], 18 => [], 19 => [], 20 => []}
    )

    @all_rooms = all_rooms
    end
  
    def display_rooms
      return all_rooms.keys
    end

  end
end