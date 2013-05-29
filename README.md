# Car Maintenance App #
This command line application will assist users in tracking the maintence they have had done on their cars.


## Features ##
- track repairs and maintenance on multiple vehicles
- edit vehicles and repairs
- view a repair log to see cost and repairs over the life of your ownership
- store notes on each repair

## Usage Instructions ##
- open app `$ ruby car.rb`
-  a list of vehicles will appear
-  command options are listed
-  user can choose from the following commands. <br/> add a vehicle/repair `add-v` `add-r`<br/> remove a vehicle/repair `remove-v` `remove-r` <br/> edit a vehicle/repair `edit-r` `edit-v`<br/> view repairs for a specified vehicle `view-r`
- program will prompt user to input correct information
- the appropriate action is taken and saved to the database

## Current State of Project ##

[![Build Status](https://travis-ci.org/lewislea/Vehicle_Maintenance_App.png)](https://travis-ci.org/lewislea/Vehicle_Maintenance_App)

basic functionality is up and running.  known bugs need to be addressed and to do list finished (see below).t

#### To Do ###
-  add views folder
-  write further tests for integration and unit testing
-  refactoring

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
-  ability to edit vehicles and repairs

#### Known Bugs ####
-  date input is in an awkward format
-  program closes after completing 2 identical tasks.  beyond that, there is no internal navigation.
-  program sometimes confirms that actions are taken when they are not.  for example, when an input is left blank.

## Author ##
Lewis Lea

## Demo Link ##
I will update with a live demo link when it is available.
