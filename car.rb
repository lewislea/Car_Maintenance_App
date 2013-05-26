 #!/usr/bin/env ruby

require './bootstrap_ar'

database = ENV['CAR_ENV'] || 'development'

connect_to database

welcome = "\nWelcome to the Car Maintenance App!\n
  What would you like to do?\n
  - to add a vehicle to the database, type 'add-v'
  - to add a repair, type 'add-r'
  - to view a list of vehicles or repairs, type 'list'\n"
puts welcome

command = gets.chomp

if command == "add-v"
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
    puts "Failure: #{new_vehicle.errors.full_messages.join(", ")}"
  end
elsif command == "add-r"
  puts "type of repair? (we'll assign it to a vehicle at the end)"
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
  #controller for all the listing stuff?
  all_vehicles = Vehicle.all
  all_vehicles.each_with_index do |vehicle|
    puts "vehicle ID: #{vehicle.id} #{vehicle.year} #{vehicle.make} #{vehicle.model}"
    end
  puts "type the numeric ID of the vehicle that the repair is to be added to"
  vehicle_id = gets.chomp
  # vehicle = Vehicle.find(vehicle_id)
  new_repair = Repair.new(type: repair_type, cost: repair_cost, mechanic: mechanic,
    date: date_of_repair, mileage: mileage_at_time, notes: repair_notes,
    vehicle_id: vehicle_id)
  if new_repair.save
    puts "repair added!"
  else
    puts "Failure: #{new_repair.errors.full_messages.join(", ")}"
  end
else command == "list"
  all_vehicles = Vehicle.all
  all_vehicles.each_with_index do |vehicle, i|
    puts "#{i+1}. #{vehicle.year} #{vehicle.make} #{vehicle.model} vehicle ID: #{vehicle.id}"
    end
  puts "\n- to view repairs for a vehicle, type view-r\n- to remove a vehicle from the list, type remove-vehicle\n- to add a vehicle, type ____\n"
  new_command = gets.chomp
    if new_command == "add-vehicle"
      #somehow get back to add-vehicle command - controller?
    elsif new_command == "view-r"
      all_vehicles.each_with_index do |vehicle|
      puts "vehicle ID: #{vehicle.id} #{vehicle.year} #{vehicle.make} #{vehicle.model} "
      end
      puts "type the ID number of vehicle to view its repairs"
      vehicle_id = gets.chomp
      matching_repairs = Repair.where(vehicle_id: vehicle_id).all
      matching_repairs.each do |repair|
        puts " date: #{repair.date} repair: #{repair.repair_type} cost: #{repair.cost}"
      end
      puts "to remove a repair, type____,\nto edit a repair, type____"
    else new_command == "remove-vehicle"
      all_vehicles = Vehicle.all
      all_vehicles.each_with_index do |vehicle|
      puts "vehicle ID: #{vehicle.id} #{vehicle.year} #{vehicle.make} #{vehicle.model} "
      end
      puts "Please choose the vehicle you would like to remove and type the ID below\n
      NOTE: all repairs associated with this vehicle will also be removed."
      vehicle_id = gets.chomp
      # matching_repair = Repair.where(vehicle_id: vehicle_id)
      if Vehicle.delete(vehicle_id)
        Repair.where(:vehicle_id => vehicle_id).destroy_all
        puts "vehicle removed!"
      else
        puts "vehicle was not able to be removed"
      end
    end
end