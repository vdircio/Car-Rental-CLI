require_relative "customer"
require_relative "car"

class Car_rental
  attr_accessor :cars, :customers

  def initialize
    @cars = []
    @customers = []
  end

  def run
    loop do
      puts "Welcome to the Car Rental Place!" 
      puts "We have a vast amount of cars for you to choose from."
      puts "What would you like to do?"
      puts "1. Add a car"
      puts "2. Add a customer"
      puts "3. List cars"
      puts "4. List customers"
      puts "5. Rent a car"
      puts "6. Return a car"
      puts "7. Exit"
      print "Choose an option: "
      option = gets.chomp.to_i
      puts "\n"

      case option
      when 1
        add_car
      when 2
        add_customer
      when 3
        list_cars
      when 4
        list_customers
      when 5
        rent_car
      when 6
        return_car
      when 7
        puts "Goodbye!"
        break
      else
        puts "Invalid option. Please try again."
      end
    end
  end

  def add_car
    print "Enter car make: "
    make = gets.chomp
    print "Enter car model: "
    model = gets.chomp
    print "Enter car year: "
    year = gets.chomp.to_i
    @cars << Car.new(make, model, year)
    puts "Car added: #{year} #{make} #{model}"
  end

  def add_customer
    print "Enter customer name: "
    name = gets.chomp
    @customers << Customer.new(name)
    puts "Customer added: #{name}"
  end

  def list_cars
    puts "List of cars:"
    @cars.each do |car|
      puts "#{car.year} #{car.make} #{car.model} - #{car.rented ? 'Rented' : 'Available'}" 
    end
  end

  def customer
    puts "List of customers:"
    @customers.each do |customer|
      puts customer.name
    end
  end

  def rent_car()
    puts "List of available cars:"
    available_cars = @cars.select { |car| 
      !car.rented 
    }

    available_cars.each_with_index { |car, index| 
      puts "#{index + 1}. #{car}" 
    }

    print "Choose a car number to rent: "
    car_index = gets.chomp.to_i - 1
    print "Enter customer name: "
    name = gets.chomp

    customer = @customers.find { |cust| 
      cust.name == name 
    }

    if customer && car_index >= 0 && car_index < available_cars.size
      customer.rent_car(available_cars[car_index])
      puts "#{customer.name} has rented #{available_cars[car_index].year} available_cars[car_index].make} #{available_cars[car_index].model}"
    else
      puts "Invalid car or customer."
    end
  end

  def return_car
    print "Enter customer name: "
    name = gets.chomp
    customer = @customers.find { |cust| 
      cust.name == name 
    }
    if customer
      puts "List of rented cars by #{customer.name}:"

      customer.rented_cars.each_with_index { |car, index| 
        puts "#{index + 1}. #{car}" 
      }
      
      print "Choose a car number to return: "
      car_index = gets.chomp.to_i - 1
      if car_index >= 0 && car_index < customer.rented_cars.size
        customer.return_car(customer.rented_cars[car_index])
        puts "#{customer.name} has returned #{customer.rented_cars[car_index].year} #{customer.rented_cars[car_index].make} #{customer.rented_cars[car_index].model}"
      else
        puts "Invalid car number."
      end
    else
      puts "Customer not found."
    end
  end
end
