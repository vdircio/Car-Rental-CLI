require "minitest/autorun"
require "./app"

class TestCarRental < Minitest::Test
  def test_add_car
    car_rental = Car_rental.new
    
    # Parameters for Car: year, make, model
    car_rental.cars << Car.new(2025, "Tesla", "Roadster")
    
    assert_equal 1, car_rental.cars.size, "Car addition failed"
    assert_includes car_rental.cars.map { |car| [car.year, car.make, car.model] }, [2025, "Tesla", "Roadster"], "Car addition failed"
  end
end
