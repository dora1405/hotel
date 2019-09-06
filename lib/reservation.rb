require 'date'


module HotelSystem
  class Reservation
    attr_reader :check_in, :check_out, :total_nights, :room_status, :total_cost, :room_num, :cost, :check_date
    
    def initialize(check_in:, check_out:, total_nights:, room_status:, total_cost:, room_num:, cost: 200, check_date:)
      @check_in = Date.parse(check_in.to_s)
      @check_out = Date.parse(check_out.to_s)
      @total_nights = total_nights
      @room_status = room_status
      @total_cost = total_cost
      @room_num = room_num
      @cost = 200
      @check_date = Date.parse(check_date.to_s)
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
      nights = num_of_nights.length
      return nights
    end
    
    
    # make a reservation of a room for a given date range
    
    def make_reservation
      hotel_rooms = BookingManager.new
      hotel_rooms.all_rooms.each do |room_num, array_dates|
        if array_dates.empty?
          hotel_rooms.all_rooms[room_num] = reserved_nights
          break
        end
      end
      return hotel_rooms.all_rooms
    end
    
    
    
    
    # access the list of reservations for a specific date, to track reservations by date
    
    def reservation_list
      rooms_reserved = []
      hotel_rooms = BookingManager.new
      hotel_rooms.all_rooms.each do |room_num, array_dates|
        if array_dates.any?(@check_date)
          rooms_reserved << room_num
        end
      end
      return "The following rooms are reserved on #{@check_date}: #{rooms_reserved}"
    end



    
    
    # get the total cost for a given reservation
    def total_cost
      total_nights = reserved_nights.length
      total_cost = total_nights * cost
      return total_cost
      
    end
    
    
    
    
  end
end