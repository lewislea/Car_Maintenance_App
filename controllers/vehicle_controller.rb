class VehicleController

  def initialize
  end

  def index
    all_vehicles = Vehicle.all
    all_vehicles.each_with_index do |vehicle|
    puts "vehicle ID: #{vehicle.id} #{vehicle.year} #{vehicle.make} #{vehicle.model} mileage: #{vehicle.mileage}"
      end
  end

  def create
    puts "*all fields required*\nWhat is the make of the vehicle?"
    make = gets.chomp
    puts "What is the model of the vehicle"
    model = gets.chomp
    puts "What year was the vehicle made?"
    year = gets.chomp
    puts "How many miles are currently on the vehicle? (do not use commas)"
    mileage = gets.chomp
    puts "When did you purchase the vehicle? YYYY/MM/DD"
    purchased_on = gets.chomp
    new_vehicle = Vehicle.new(make: make, model: model, year: year, mileage: mileage, purchased_on: purchased_on)
    if new_vehicle.save
      puts "vehicle added!"
    else
      puts "Failure: #{new_vehicle.errors.full_messages.join(", ")}"
    end
  end

  def delete(vehicle_id)
    puts "Please choose the vehicle you would like to remove and type the ID below\n
    NOTE: all repairs associated with this vehicle will also be removed."
    vehicle_id = gets.chomp
    if Vehicle.delete(vehicle_id)
      Repair.where(:vehicle_id => vehicle_id).destroy_all
      puts "vehicle removed!"
    else
      puts "vehicle was not able to be removed"
    end
  end

end
