 #!/usr/bin/env ruby

require './bootstrap_ar'
# require_relative 'views/command_list'

database = ENV['CAR_ENV'] || 'development'
connect_to database
# welcome = Launch.commands_list
welcome = "\nWelcome to the Car Maintenance App!\n
  What would you like to do?\n
  - to add a vehicle to the database, type 'add-vehicle'
  - to add a repair, type 'add-repair'
  - to view a list of vehicles, type 'list-vehicles'\n"
puts welcome

# ARGV = [add, foo]
# command = ARGV[0]
command = gets.chomp

if command == "add-vehicle"
  puts "What is the make of the vehicle?"
  make = gets.chomp
  puts "What is the model of the vehicle"
  model = gets.chomp
  puts "What year was the vehicle made?"
  year = gets.chomp
  puts "How many miles are currently on the vehicle?"
  mileage = gets.chomp
  puts "When did you purchase the vehicle?"
  purchased_on = gets.chomp
  new_vehicle = Vehicle.new(make: make, model: model, year: year, mileage: mileage, purchased_on: purchased_on)
  if new_vehicle.save
    puts "vehicle added!"
  else
    puts "Failure: #{vehicle.errors.full_messages.join(", ")}"
  end
elsif command == "add-repair"
  puts "What type of repair would you like to log? (We'll assign it to a vehicle at the end."
  repair_type = gets.chomp
  puts "How much did the repair cost?"
  repair_cost = gets.chomp
  puts "Which mechanic did the repair?"
  mechanic = gets.chomp
  puts "What was the date of the repair?"
  date_of_repair = gets.chomp
  puts "What mileage was on the vehicle at the time of the repair?"
  mileage_at_time = gets.chomp
  puts "Please type any other notes that you would like to document the repair."
  repair_notes = gets.chomp
  puts "Which vehicle would you like to add a repair to?"
  all_vehicles = Vehicle.all
  all_vehicles.each_with_index do |vehicle, i|
    puts "#{i+1}. #{vehicle.year} #{vehicle.make} #{vehicle.model} vehicle ID: #{vehicle.id}"
    end
  puts "type the ID of the vehicle that the repair is to be added to"
  vehicle_id = gets.chomp
  # vehicle = Vehicle.find(vehicle_id)

  new_repair = Repair.new(repair_type: repair_type, repair_cost: repair_cost, mechanic: mechanic,
    date_of_repair: date_of_repair, mileage_at_time_of_repair: mileage_at_time, repair_notes: repair_notes,
    vehicle_id: vehicle_id)
  if new_repair.save
    puts "repair added!"
  else
    puts "Failure: #{repair.errors.full_messages.join(", ")}"
  end
else command == "list-vehicles"
  puts "\nTo view repairs for a vehicle, type __\n To remove a vehicle from the list, type
  ____.\nTo add a vehicle, type ____\n"
  # all_vehicles = Vehicle.all
  # vehicle.each_with_index do |vehicle, i|
  #   puts "#{i+1}. #{vehicle.make} vehicle ID: #{vehicle.id}"
end
# elsif command == "remove"
#   project_name = ARGV[1]
#   matching_projects = Project.where(name: project_name).all
#   matching_projects.each do |project|
#     project.destroy
  # end
# end