class Customer
  attr_accessor :name, :rented_cars

  def initialize(name)
    :name = name
    rented_cars = []
  end

  def rent_car(car)
    @rented_cars << car
    car.rent
  end

  def return_car(car)
    @rented_cars.delete(car)
    car.return_car
  end

end
