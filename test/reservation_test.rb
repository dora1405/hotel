require_relative 'test_helper'


describe "Reservation class" do
  before do
    @reservations = HotelSystem::Reservation.new(
      check_in: "2019-10-10",
      check_out: "2019-10-13",
      total_nights: 3,
      room_status: nil,
      total_cost: 600,
      room_num: 1,
      check_date: "2019-10-11"
    )
  end
  
  it "is an instance of Reservation" do
    expect(@reservations).must_be_kind_of HotelSystem::Reservation
  end
  
  it "find reserved_nights" do
    expect(@reservations.reserved_nights).must_equal [Date.parse("2019-10-10"), Date.parse("2019-10-11"), Date.parse("2019-10-12")]
  end
  
  
  it "make a reservation of a room with given date range" do
    @hotel_rooms = HotelSystem::BookingManager.new
    expect(@reservations.make_reservation).must_equal 1 => [Date.parse("2019-10-10"), Date.parse("2019-10-11"), Date.parse("2019-10-12")], 2 => [], 3=>[], 4=>[], 5=>[], 6=>[], 7=>[], 8=>[], 9=>[], 10=>[], 11=>[], 12=>[], 13=>[], 14=>[], 15=>[], 16=>[], 17=>[], 18=>[], 19=>[], 20=>[]
  end
  
  it "find list of reservations(rooms) for a specified date" do
    @hotel_rooms = HotelSystem::BookingManager.new
    @reservations.make_reservation
    expect(@reservations.reservation_list).must_equal "The following rooms are reserved on 2019-10-11: [1]"
  end
  
  it "find total cost" do
    expect(@reservations.total_cost).must_equal 600
  end
  
  it "find list of available rooms given a date" do
    @hotel_rooms = HotelSystem::BookingManager.new
    @reservations.make_reservation
    expect(@reservations.available_rooms).must_equal "The following rooms are available for reservation on 2019-10-11: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]"
    
  end
end