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
  - to view and edit or remove repairs, type 'view-r'
  - to remove a vehicle, type 'remove-v'
  - to remove a repair, type 'remove-r'
  - to edit a vehicle 'edit'\n\n"
puts welcome_next

command = gets.chomp

if command == "add-v"
  v_controller.create
elsif command == "add-r"
  r_controller.create
elsif command == "remove-v"
  v_controller.delete(vehicle_id)
elsif command == "remove-r"
  puts "Which vehicle was the repair done on?  type vehicle ID below.\n"
  vehicle_id = gets.chomp
  r_controller.index(vehicle_id)
  puts "type the ID of the repair you would like to delete"
  repair_id = gets.chomp
  r_controller.delete(repair_id)
elsif command == "edit"
  puts "would you like to edit a vehicle or repair?"
else command == "view-r"
  r_controller.index(vehicle_id)
  puts "\nto remove a repair, type 'remove',\nto edit a repair, type 'edit'\nto quit, hit ENTER.\n"
  new_command = gets.chomp
  if new_command == "remove"
   puts "type the ID of the repair you would like to delete"
   repair_id = gets.chomp
   r_controller.delete(repair_id)
  else new_command == "edit"

  end

end