require_relative 'test_helper'


describe "Date class" do
  
  before do
    @date_range = HotelSystem::DateRange.new(
      check_in: Date.parse("2019-10-10"),
      check_out: Date.parse("2019-10-13")
    )
  end
  
  it "is an instance of Date" do
    expect(@date_range).must_be_kind_of HotelSystem::DateRange
    
  end

  it "checks for invalid date range" do
    @date_range.check_out = Date.parse("2019-10-09")
    expect{@date_range.date_checker}.must_raise ArgumentError
    
  end
  
end