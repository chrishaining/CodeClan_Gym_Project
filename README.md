# CodeClan Gym Project

## Project description:
The end-product for this project is a web application for a gym. The user would be a member of staff at the gym.

## Brief
## Gym
A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

# MVP
* The app should allow the gym to create / edit / delete members
* The app should allow the gym to create / edit / delete classes
* The app should allow the gym to add members to specific classes
* The app should show a list of all upcoming classes
* The app should show all members that are registered for a particular class

Inspired By
Glofox, Pike13

# Possible Extensions
* Classes could have a maximum capacity, and users can only be added while there is space remaining.
* The gym could be able to give its members Premium or Standard membership. Standard members can only be signed up for classes during off-peak hours.

## Requirements:
* Web browser
* create a database called gym

## Testing
* TDD on the models using Minitest - see specs
* pry testing on db/seeds.rb
* running the code in browser

## Built with:
* Ruby
* Sinatra
* pSQL
* Minitest gem
* pry gem
* pg gem

## To run the app
* In browser, select localhost:4567
* In Terminal:
  * createdb gym
  * db/psql -d gym -f gym.sql
  * ruby db/seeds.rb
  * ruby app_controller.rb

## Acknowledgements
* CodeClan instructors: Alex, Colin, Katie, Keith, Sky
* my CodeClan classmates
