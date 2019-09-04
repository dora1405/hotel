require 'date'


module HotelSystem
  class Reservation
    attr_reader :check_in, :check_out, :total_nights, :room_status, :total_cost, :name, :room_num
    
    def initialize(check_in, check_out, total_nights, rm_status, total_cost, name, room_num)
      @check_in = check_in
      @check_out = check_out
      @total_nights = total_nights
      @room_status = room_status
      @total_cost = total_cost
      @name = name
      @room_num = room_num
    end
    
    # access the list of all of the rooms in the hotel
    def display_rooms
      rooms_list = BookingManager.new
      return rooms_list.all_rooms
      

    end
    
    
  end
end