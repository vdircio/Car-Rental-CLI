require "minitest/autorun"
require "./app"

class TestCarRental < Minitest::Test
  def test_add_car
    car_rental = Car_rental.new
    car1 = Car.new(2025, "Tesla", "Roadster")
    
    car_rental.add_car(car1)
    assert_equal 1, car_rental.cars.size, "Car addition failed"
    assert_includes car_rental.cars, car1, "Car addition failed"
  end

  def test_add_customer
    car_rental = Car_rental.new
    
    car_rental.add_customer("Victor")
    assert_equal 1, car_rental.customers.size, "Customer addition failed"
    assert_includes car_rental.customers, "Victor", "Customer addition failed"
  end

  def test_rent_car
    car_rental = Car_rental.new
    car1 = Car.new(2025, "Tesla", "Roadster")
    
    car_rental.add_car(car1)
    car_rental.add_customer("Victor")
    
    car1.rented = true
    assert car1.rented, "Car should be rented"
  end

  # def test_return_car
  #   car_rental = Car_rental.new
  #   car1 = Car.new(2025, "Tesla", "Roadster")
    
  #   car_rental.add_car(car1)
  #   car_rental.add_customer("Victor")
    
  #   car1.rented = false
  #   refute car1.rented, "Car should not be rented"
  # end
end
