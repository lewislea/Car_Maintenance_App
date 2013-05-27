# Car Maintenance App #
This command line application will assist users in tracking the maintence they have had done on their cars.

## Features ##
- track repairs and maintenance on multiple vehicles
- view a repair log to see cost and repairs over the life of your ownership
- store notes on each repair

## Usage Instructions ##
- open app `$ ruby car.rb`
-  a list of vehicles will appear
-  command options are listed
-  user can add a vehicle/repair `add-v` `add-r`, remove a vehicle/repair `remove-v` `remove-r`, or view repairs for a certain vehicle `view-r`
- program will prompt user to input correct information
- the appropriate action is taken and saved to the database

## Current State of Project ##
basic functionality is up and running.  some features needs to be tweaked and refactoring is needed.

#### To Do ###
-  ability to edit exhisting vehicles and repairs
-  add views
-  begin integration and unit testing

#### Done ####
-  user stories
-  acceptance criteria
-  prioritize user stories & features
-  vehicles are able to be added and saved
-  repairs are able to be added and saved
-  repairs for each vehicle are able to viewed in a list
-  ability to remove individual repairs
-  added controllers
-  model validation when adding repairs and vehicles

#### Known Bugs ####
-  date input is in an awkward format
-  program closes after completing each task.  there is no internal navigation.

## Author ##
Lewis Lea

## Demo Link ##
I will update with a live demo link when it is available.
