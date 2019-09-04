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

end