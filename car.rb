 #!/usr/bin/env ruby

require './bootstrap_ar'

database = ENV['CAR_ENV'] || 'development'

connect_to database

welcome = "\nWelcome to the Car Maintenance App!\n\nHere is a list of your vehicles.\n"
puts welcome

puts
v_controller = VehicleController.new
r_controller = RepairController.new
v_controller.index
puts

welcome_next = "What would you like to do?\n
  - to add a vehicle to the database, type 'add-v'
  - to add a repair, type 'add-r'
  - to view a list of repairs, type 'view-r'
  - to remove a vehicle, type 'remove-v'
  - to remove a repair, type 'remove-r'\n\n"
puts welcome_next

command = gets.chomp

if command == "add-v"
  puts "*all fields required*\nWhat is the make of the vehicle?"
  make = gets.chomp
  puts "What is the model of the vehicle"
  model = gets.chomp
  puts "What year was the vehicle made?"
  year = gets.chomp
  puts "How many miles are currently on the vehicle?"
  mileage = gets.chomp
  puts "When did you purchase the vehicle? YYYY/MM/DD"
  purchased_on = gets.chomp
  new_vehicle = Vehicle.new(make: make, model: model, year: year, mileage: mileage, purchased_on: purchased_on)
  if new_vehicle.save
    puts "vehicle added!"
    puts "would you like to do something else? Y or N"
    y_or_n = gets.chomp
    if yes_or_no == "y" or yes_or_no == "Y" or yes_or_no == "YES" or yes_or_no == "yes"
      `ruby car.rb`
    end
  else
    puts "Failure: #{new_vehicle.errors.full_messages.join(", ")}"
    puts "would you like to do something else? Y or N"
    yes_or_no = gets.chomp
    if yes_or_no == "y" or yes_or_no == "Y" or yes_or_no == "YES" or yes_or_no == "yes"
      `car.rb`
    end
  end
elsif command == "add-r"
  puts "\n*all fields required*\ntype of repair? (we'll assign it to a vehicle at the end)"
  repair_type = gets.chomp
  puts "repair cost?"
  repair_cost = gets.chomp
  puts "what mechanic did you use?"
  mechanic = gets.chomp
  puts "date of the repair? YYYY/MM/DD"
  date_of_repair = gets.chomp
  puts "mileage on the vehicle at the time of the repair?"
  mileage_at_time = gets.chomp
  puts "type any other notes that you would like to document the repair."
  repair_notes = gets.chomp
  puts "which vehicle would you like to add a repair to?"
  v_controller.index
  puts "type the numeric ID of the vehicle that the repair is to be added to"
  vehicle_id = gets.chomp
  # vehicle = Vehicle.find(vehicle_id)
  new_repair = Repair.new(repair_type: repair_type, cost: repair_cost, mechanic: mechanic,
    date: date_of_repair, mileage: mileage_at_time, notes: repair_notes,
    vehicle_id: vehicle_id)
  if new_repair.save
    puts "repair added!"
  else
    puts "Failure: #{new_repair.errors.full_messages.join(", ")}"
  end
elsif command == "remove-v"
  puts "Please choose the vehicle you would like to remove and type the ID below\n
      NOTE: all repairs associated with this vehicle will also be removed."
      vehicle_id = gets.chomp
      v_controller.delete(vehicle_id)
elsif command == "remove-r"
  puts "Which vehicle was the repair done on?  type vehicle ID below.\n"
      vehicle_id = gets.chomp
      r_controller.index(vehicle_id)
  puts "Which repair would you like to delete?"
    repair_id = gets.chomp
      r_controller.delete(repair_id)
else command == "view-r"
      puts "type the ID number of vehicle to view its repairs"
      vehicle_id = gets.chomp
      r_controller.index(vehicle_id)
      puts "to remove a repair, type____,\nto edit a repair, type____"

end