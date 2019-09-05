require_relative 'test_helper'


describe "Booking_manager class" do
before do
  @booking = HotelSystem::BookingManager.new(
  name: "John Doe",
  check_in: 2019-10-10,
  check_out: 2019-10-13
  )
end


it "is an instance of Booking_manager" do
expect(@booking).must_be_kind_of HotelSystem::BookingManager

end


it "access the list of all of the rooms in the hotel" do
  expect(@booking.display_rooms).must_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 ,19, 20]
  
end


end