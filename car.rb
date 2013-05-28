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
  - to add a vehicle or repair to the database, type 'add-v' or 'add-r'
  - to view repairs for a vehicle, type 'view-r'
  - to remove a vehicle or repair, type 'remove-v' or 'remove-r'
  - to edit a vehicle or repair, type 'edit-v' or 'edit-r'"
puts welcome_next

command = gets.chomp

if command == "add-v"
  v_controller.create
  puts "would you like to add another vehicle? type Y or N"
  yorn = gets.chomp
  if yorn == "Y" or yorn == "yes" or yorn == "YES" or yorn =="y"
    v_controller.create
  else
  end
elsif command == "add-r"
  r_controller.create
  puts "would you like to add another repair? type Y or N"
  yorn = gets.chomp
  if yorn == "Y" or yorn == "yes" or yorn == "YES" or yorn =="y"
    r_controller.create
  else
  end
elsif command == "remove-v"
  v_controller.delete(vehicle_id)
  puts "would you like to remove another vehicle?"
  yorn = gets.chomp
  if yorn == "Y" or yorn == "yes" or yorn == "YES" or yorn =="y"
    v_controller.delete(vehicle_id)
  else
  end
elsif command == "remove-r"
  puts "Which vehicle was the repair done on?  type vehicle ID below.\n"
  vehicle_id = gets.chomp
  r_controller.index(vehicle_id)
  puts "type the ID of the repair you would like to delete"
  repair_id = gets.chomp
  r_controller.delete(repair_id)
elsif command == "edit-v"
  v_controller.update
  v_controller.index
  puts "would you like to edit something else? type Y or N"
  yorn = gets.chomp
  if yorn == "Y" or yorn == "yes" or yorn == "YES" or yorn =="y"
    v_controller.update
    v_controller.index
  else
  end
elsif command == "edit-r"
  r_controller.index(vehicle_id)
  r_controller.update
  puts "would you like to edit something else? type Y or N"
  yorn = gets.chomp
  if yorn == "Y" or yorn == "yes" or yorn == "YES" or yorn =="y"
    r_controller.index(vehicle_id)
    r_controller.update
  else
  end
else command == "view-r"
  r_controller.index(vehicle_id)
  puts "would you like to view repairs for another vehicle? type Y or N"
  yorn = gets.chomp
  if yorn == "Y" or yorn == "yes" or yorn == "YES" or yorn =="y"
    v_controller.index
    r_controller.index(vehicle_id)
  else
  end


end