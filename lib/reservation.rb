require 'date'


module HotelSystem
  class Reservation
    attr_reader :check_in, :check_out, :total_nights, :room_status, :total_cost, :name, :room_num, :cost
    
    def initialize(check_in:, check_out:, total_nights:, room_status:, total_cost:, name:, room_num:, cost: 200)
      @check_in = Date.parse(check_in.to_s)
      @check_out = Date.parse(check_out.to_s)
      @total_nights = total_nights
      @room_status = room_status
      @total_cost = total_cost
      @name = name
      @room_num = room_num
      @cost = 200
    end
    
    def reserved_nights
      reservation_nights = []
      reservation_nights << @check_in
      while @check_in < (@check_out - 1)
        reservation_nights << @check_in += 1
      end
      return reservation_nights
    end
    
    def total_nights
      total_nights = num_of_nights.length
      return to
    end
    
    
    # make a reservation of a room for a given date range
    
    def make_reservation
      display_rooms.each do |room_num, array_dates|
        if array_dates.empty?
          display_rooms[room_num] = reservation_nights
        end
        array_dates.each do |dates|
          if dates == nil
            dates = reservation_nights
          end
        end
      end
    end
    
    
    
    
    # access the list of reservations for a specific date, to track reservations by date
    
    
    
    # get the total cost for a given reservation
    def total_cost
      total_nights = reserved_nights.length
      total_cost = total_nights * cost
      return total_cost
      
    end
    
    
    
    
  end
end