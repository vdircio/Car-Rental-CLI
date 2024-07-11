class Car
  attr_accessor :year, :make, :model, :rented

  def initialize(year, make, model)
    @year = year
    @make = make
    @model = model
    @rented = false
  end

  def rent
    :rented = true
  end

  def return_car
    :rented = false
  end

  def to_s
    "#{year} #{make} #{model} - #{rented ? 'Rented' : 'Available'}"
  end
end
