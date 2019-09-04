require_relative 'test_helper'


describe "Date class" do

before do
  @date_range = HotelSystem::DateRange.new(
  check_in: 2019-10-10,
  check_out: 2019-10-13
  )
end

it "is an instance of Date" do
expect(@date_range).must_be_kind_of HotelSystem::DateRange

end


end