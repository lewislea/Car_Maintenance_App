#!/usr/bin/env ruby

require_relative 'bootstrap_ar'

# ARGV = [add, foo]
command = ARGV[0]

if command == "add"
  project_name = ARGV[1]
  project = Project.new(name: project_name)
  if project.save
    puts "Success!"
  else
    puts "Failure: #{project.errors.full_messages.join(", ")}"
  end
elsif command == "list"
  projects = Project.all
  projects.each_with_index do |project, i|
    puts "#{i+1}. #{project.name}"
  end
elsif command == "remove"
  project_name = ARGV[1]
  matching_projects = Project.where(name: project_name).all
  matching_projects.each do |project|
    project.destroy
  end
end