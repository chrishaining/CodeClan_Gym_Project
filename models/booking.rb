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
def save()
  sql = "
  INSERT INTO bookings
  (member_id, fitness_class_id)
  VALUES
  ($1, $2)
  RETURNING *
  "
  values = [@member_id, @fitness_class_id]
  booking = SqlRunner.run(sql, values).first
  @id = booking['id'].to_i
end

#define a function to view all bookings (the READ of CRUD)
def self.view_all()
 sql = "SELECT * FROM bookings"
 bookings_data = SqlRunner.run(sql)
 result = bookings_data.map { |booking| Booking.new(booking) }
 return result
end

#define a function to view a specific booking/set of bookings (the READ of CRUD). Version A
def self.view_booking_by_id(id)
  sql = "
  SELECT * FROM bookings
  WHERE id = $1"
  values = [id]
  booking_info = SqlRunner.run(sql, values)
  return Booking.new(booking_info.first)
  return result
end

#define a function to view a specific booking/set of bookings (the READ of CRUD). Version B
def view()
  sql = "
  SELECT * FROM bookings"
  result = SqlRunner.run(sql)[0]
  return result
end

#define a function to update a booking (the UPDATE of CRUD)
def update()
  sql ="
  UPDATE bookings
  SET member_id = $1, fitness_class_id = $2
  WHERE id = $3
  "
  values = [@member_id, @fitness_class_id, @id]
  SqlRunner.run(sql, values)
end

#define a function to delete all bookings (the DELETE of CRUD)
def self.delete_all()
sql = "DELETE FROM bookings"
SqlRunner.run(sql)
end

#define a function to delete a specific booking (the DELETE of CRUD). version A
def delete()
  sql ="
  DELETE FROM bookings
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

#define a function to delete a specific booking (the DELETE of CRUD). version B
def self.delete_booking_by_id(id)
  sql = "
  DELETE FROM bookings
  WHERE id = $1"
  values = [id]
  SqlRunner.run(sql, values)
end


#Final end
end
