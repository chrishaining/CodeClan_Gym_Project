require("minitest/autorun")
require('minitest/rg')
require_relative("../booking")

class BookingTest < Minitest::Test

  def setup
    options = {'id' => 1, 'member_id' => 4, 'fitness_class_id' => 3}
    @booking1 = Booking.new(options)
  end

  def test_booking_id
    assert_equal(1, @booking1.id)
  end

  def test_member_id
    assert_equal(4, @booking1.member_id)
  end

  def test_fitness_class_id
    assert_equal(3, @booking1.fitness_class_id)
  end

  #FINAL END
end
