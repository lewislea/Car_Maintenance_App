 #!/usr/bin/env ruby

require './bootstrap_ar'
# require_relative 'views/command_list'

database = ENV['CAR_ENV'] || 'development'
connect_to database

welcome = "\nWelcome to the Car Maintenance App!\n
  What would you like to do?\n
  - to add a vehicle to the database, type 'add-vehicle'
  - to add a repair, type 'add-repair'
  - to view a list of vehicles, type 'list-vehicles'"
puts welcome

# ARGV = [add, foo]
# command = ARGV[0]
command = gets.chomp

if command == "add-vehicle"
  puts "What is the make of the vehicle?"
  vehicle_make = gets.chomp
  # vehicle_make = ARGV[1]
  new_vehicle = Vehicle.new(make: vehicle_make)
  if new_vehicle.save
    puts "vehicle added!"
  else
    puts "Failure: #{vehicle.errors.full_messages.join(", ")}"
  end
elsif command == "add-repair"
  repair = ARGV[1]
  new_repair = Vehicle.new(repair_type: repair)
  if repair.save
    puts "repair added!"
  else
    puts "Failure: #{repair.errors.full_messages.join(", ")}"
  end
else command == "list"
  # all_vehicles = Vehicle.all
  # vehicle.each_with_index do |vehicle, i|
  #   puts "#{i+1}. #{vehicle.make}"
end
# elsif command == "remove"
#   project_name = ARGV[1]
#   matching_projects = Project.where(name: project_name).all
#   matching_projects.each do |project|
#     project.destroy
  # end
# end