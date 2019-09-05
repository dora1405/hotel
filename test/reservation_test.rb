require_relative 'test_helper'


describe "Reservation class" do
  before do
    @reservations = HotelSystem::Reservation.new(
      check_in: "2019-10-10",
      check_out: "2019-10-13",
      total_nights: 2,
      room_status: nil,
      total_cost: 600,
      name: "John Doe",
      room_num: 1
    )
  end
  
  it "is an instance of Reservation" do
    expect(@reservations).must_be_kind_of HotelSystem::Reservation
  end
  
  
  # make a reservation of a room for a given date range
  it "make a reservation of a room for a given date range" do
    id = rand(1000000000..9999999999)
    
    expect(@reservations.make_reservation).must_equal all_rooms[1] = [id => ["2019-10-10", "2019-10-11", "2019-10-12", "2019-10-13"]]
  end
  
end