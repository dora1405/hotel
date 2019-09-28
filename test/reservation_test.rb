require_relative 'test_helper'


describe "Reservation class" do
  before do
    @reservations = HotelSystem::Reservation.new
  end
  
  it "is an instance of Reservation" do
    expect(@reservations).must_be_kind_of HotelSystem::Reservation
  end

  it "checks for invalid date range" do
    expect{@reservations.make_reservation("2019-10-13", "2019-10-10")}.must_raise ArgumentError
    
  end
  
  it "make a reservation of a room with given date range" do
    expect(@reservations.make_reservation("2019-10-10", "2019-10-13")).must_equal 1 => [Date.parse("2019-10-10"), Date.parse("2019-10-11"), Date.parse("2019-10-12")], 2 => [], 3=>[], 4=>[], 5=>[], 6=>[], 7=>[], 8=>[], 9=>[], 10=>[], 11=>[], 12=>[], 13=>[], 14=>[], 15=>[], 16=>[], 17=>[], 18=>[], 19=>[], 20=>[]
  end

  # it "find reserved_nights" do
  #   expect(@reservations.reserved_nights).must_equal [Date.parse("2019-10-10"), Date.parse("2019-10-11"), Date.parse("2019-10-12")]
  # end
  
  
  
  # it "raise ArgumentError is no rooms are available" do
  #   @hotel_rooms = HotelSystem::BookingManager.new
  #   @reservations.make_reservation
  #   all_rooms = {1 => [Date.parse("2019-10-09")], 2 => [Date.parse("2019-10-10"), Date.parse("2019-10-11")], 3=>[Date.parse("2019-10-10"), Date.parse("2019-10-11")], 4=>[Date.parse("2019-10-11")], 5=>[Date.parse("2019-10-11")], 6=>[Date.parse("2019-10-11"), Date.parse("2019-10-12")], 7=>[Date.parse("2019-10-11"), Date.parse("2019-10-12")], 8=>[Date.parse("2019-10-10")], 9=>[Date.parse("2019-10-10")], 10=>[Date.parse("2019-10-10")], 11=>[Date.parse("2019-10-12")], 12=>[Date.parse("2019-10-10")], 13=>[Date.parse("2019-10-11")], 14=>[Date.parse("2019-10-10")], 15=>[Date.parse("2019-10-10")], 16=>[Date.parse("2019-10-10")], 17=>[Date.parse("2019-10-10")], 18=>[Date.parse("2019-10-12")], 19=>[Date.parse("2019-10-12")], 20=>[Date.parse("2019-10-11"), Date.parse("2019-10-12")]}
  #   expect{@reservations.make_reservation}.must_raise ArgumentError
  # end
  
  # it "find list of reservations(rooms) for a specified date" do
  #   @reservations.make_reservation
  #   expect(@reservations.find_reserved_rooms).must_equal "The following rooms are reserved on 2019-10-11: [1]"
  # end
  
  # it "find total cost" do
  #   expect(@reservations.total_cost).must_equal 600
  # end
  
  # it "find list of available rooms given a date" do
  #   @reservations.make_reservation
  #   expect(@reservations.find_available_rooms).must_equal "The following rooms are available for reservation on 2019-10-11: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]"
    
  # end
end