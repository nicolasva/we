class ProTest < ActiveSupport::TestCase

  test "scope find_skills" do
    booking = Booking.find(3)
    assert_equal Pro.find_skills(booking).pluck(:name), ["Nathalie"]
  end

  test "scope find_datetime" do
    booking = Booking.find(3)
    assert_equal Pro.find_openning(booking).pluck(:name), ["Sophie", "Franck"]
  end

  test "test find_distance" do
    booking = Booking.find(3)
    assert_equal Pro.find_distance(Pro.all, booking).pluck(:name), ["Nathalie", "Sophie", "Franck"]
  end
end