require_relative('../db/sql_runner')

class Booking

  attr_reader :id
  attr_accessor :member_id, :fitness_class_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @member_id = options['member_id'].to_i
  @fitness_class_id = options['fitness_class_id'].to_i
end

#define a function to create a new booking (the CREATE of CRUD)


#define a function to view all bookings (the READ of CRUD)

#define a function to view a specific booking/set of bookings (the READ of CRUD)


#define a function to update a booking (the UPDATE of CRUD)


#define a function to delete all bookings (the DELETE of CRUD)

#define a function to delete a specific booking (the DELETE of CRUD)


#Final end
end
