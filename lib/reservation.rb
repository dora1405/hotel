require 'date'


module HotelSystem
  class Reservation
    attr_reader :check_in, :check_out, :total_nights, :room_status, :total_cost, :name, :room_num
    
    def initialize(check_in:, check_out:, total_nights:, room_status:, total_cost:, name:, room_num:)
      @check_in = Date.parse(check_in.to_s)
      @check_out = Date.parse(check_out.to_s)
      @total_nights = total_nights
      @room_status = room_status
      @total_cost = total_cost
      @name = name
      @room_num = room_num
    end
    
    # make a reservation of a room for a given date range
    
    def make_reservation
      display_rooms
      
      date_range = []
      i = 0
      
      while check_in < check_out
        date_range << check_in += i
        i += 1
      end
      
      
      date_range.each do |date|
        if date != rooms_list.all_rooms
          
          
          test = {1 => []}
          
          test[1] = 1
          
          puts test
          
        end
      end
      
    end
  end
end