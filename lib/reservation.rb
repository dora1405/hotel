module HotelSystem
  class Reservation
    #attr_reader :check_in, :check_out, :total_nights, :room_status, :total_cost, :room_num, :hotel_rooms
    
    # COST = 200
    def initialize
    #   @check_in = Date.parse(check_in.to_s)
    #   @check_out = Date.parse(check_out.to_s)
      # @total_nights = total_nights
      # @room_status = room_status
      # @total_cost = total_cost
      # @room_num = room_num
      # @check_date = Date.parse(check_date.to_s)
      @hotel_rooms = BookingManager.new
    end
    
    def make_reservation(check_in, check_out)
      check_in = Date.parse(check_in.to_s)
      check_out = Date.parse(check_out.to_s)

      if check_out < check_in
        raise ArgumentError, "Invalid check-out date"
      end
      
      reservation_nights = []
      reservation_nights << check_in
      while check_in < (check_out - 1)
        reservation_nights << check_in += 1
      end
      last_night = check_out - 1
      rooms_checked = 0
      @hotel_rooms.all_rooms.each do |room, dates|
        if dates.empty?
          @hotel_rooms.all_rooms[room] = reservation_nights
          break
        end
        if check_in.between?(dates[0], dates[-1]) || last_night.between?(dates[0], dates[-1])
        else
          @hotel_rooms.all_rooms[room_num] = reservation_nights
          break
        end
        rooms_checked += 1
        if rooms_checked == 20
          raise ArgumentError, "No rooms available for these dates."
        end
      end
      return @hotel_rooms.all_rooms      
    end
    

    
    
    # def total_nights
    #   nights = num_of_nights.length
    #   return nights
    # end
    
    
    # def total_cost
    #   total_nights = reserved_nights.length
    #   total_cost = total_nights * COST
    #   return total_cost
    # end
    
    
    
    
    # def find_reserved_rooms
    #   rooms_reserved = []
    #   hotel_rooms.all_rooms.each do |room_num, array_dates|
    #     if array_dates.any?(@check_date)
    #       rooms_reserved << room_num
    #     end
    #   end
    #   return "The following rooms are reserved on #{@check_date}: #{rooms_reserved}"
    # end
    
    
    # def find_available_rooms
    #   rooms_available = []
    #   available_dates = [] 
    #   hotel_rooms.all_rooms.each do |room_num, array_dates|
    #     if array_dates.none? @check_date
    #       rooms_available << room_num
    #     end
    #   end
    #   return "The following rooms are available for reservation on #{@check_date}: #{rooms_available}"
    # end
  end
end