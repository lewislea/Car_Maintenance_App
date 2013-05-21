 #!/usr/bin/env ruby

require './bootstrap_ar'
database = ENV['CAR_ENV'] || 'development'
connect_to database

# ARGV = [add, foo]
command = ARGV[0]

if command == "add"
  vehicle_make = ARGV[1]
  new_vehicle = Vehicle.new(make: vehicle_make)
  if new_vehicle.save
    puts "Success!"
  else
    puts "Failure: #{vehicle.errors.full_messages.join(", ")}"
  end
else command == "list"
  all_vehicles = Vehicle.all
  vehicle.each_with_index do |vehicle, i|
    puts "#{i+1}. #{vehicle.make}"
end
# elsif command == "remove"
#   project_name = ARGV[1]
#   matching_projects = Project.where(name: project_name).all
#   matching_projects.each do |project|
#     project.destroy
  # end
end