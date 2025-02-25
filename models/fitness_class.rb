require_relative('../db/sql_runner')
require 'date'
require 'time'


class FitnessClass

  attr_accessor :name, :datetime, :capacity 
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @datetime = options['datetime']
    @capacity = options['capacity'].to_i
  end


  def format_date
    datetime_obj = DateTime.parse(@datetime)
    datetime_obj.strftime('%d/%m/%Y')
  end

  def format_time
    datetime_obj = DateTime.parse(@datetime)
    datetime_obj.strftime('%H:%M')
  end

  def format_date_for_browser
    datetime_parts = @datetime.split(" ")
    datetime_parts[0] + "T" + datetime_parts[1]
  end

  #define a function to create a new fitness class (the CREATE of CRUD)
  def save()
    sql = "
    INSERT INTO fitness_classes
    (name, datetime, capacity)
    VALUES
    ($1, $2, $3)
    RETURNING *
    "
    values = [@name, @datetime, @capacity]
    fitness_class = SqlRunner.run(sql, values).first
    @id = fitness_class['id'].to_i
  end

  #define a function to view all fitness classes (the READ of CRUD)
  def self.view_all()
    sql = "SELECT * FROM fitness_classes"
    fitness_classes_data = SqlRunner.run(sql)
    result = fitness_classes_data.map { |fitness_class| FitnessClass.new(fitness_class) }
    return result
  end

  def self.view_upcoming_classes()
    sql = "SELECT * FROM fitness_classes
    WHERE datetime >= CURRENT_TIMESTAMP
    ORDER BY datetime ASC"
    fitness_classes_data = SqlRunner.run(sql)
    result = fitness_classes_data.map { |fitness_class| FitnessClass.new(fitness_class) }
    return result
  end

  def self.view_archived_classes()
    sql = "SELECT * FROM fitness_classes
    WHERE datetime <= CURRENT_TIMESTAMP
    ORDER BY datetime ASC"
    fitness_classes_data = SqlRunner.run(sql)
    result = fitness_classes_data.map { |fitness_class| FitnessClass.new(fitness_class) }
    return result
  end

  #define a function to view a specific fitness class/set of fitness classes (the READ of CRUD).Version A
  def self.view_class_by_id(id)
    sql = "
    SELECT * FROM fitness_classes
    WHERE id = $1"
    values = [id]
    class_info = SqlRunner.run(sql, values)
    return FitnessClass.new(class_info.first)
  end

  #define a function to view a specific fitness class/set of fitness classes (the READ of CRUD).Version B
  def view()
    sql = "
    SELECT * FROM fitness_classes"
    result = SqlRunner.run(sql)[0]
    return result
  end

  #define a function to update a fitness class (the UPDATE of CRUD)
  def update()
    sql ="
    UPDATE fitness_classes
    SET name = $1, datetime = $2, capacity = $3
    WHERE id = $4
    "
    values = [@name, @datetime, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  #define a function to delete all fitness classes (the DELETE of CRUD)
  def self.delete_all()
    sql = "DELETE from fitness_classes"
    SqlRunner.run(sql)
  end

  #define a function to delete a specific fitness class (the DELETE of CRUD). Version A
  def delete()
    sql ="
    DELETE FROM fitness_classes
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #define a function to delete a specific fitness class (the DELETE of CRUD). Version B
  def self.delete_fitness_class_by_id(id)
    sql = "
    DELETE FROM fitness_classes
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  #for the MVP: the app should show all members that are registered for a particular class. To do this: access the members table via an inner joint with bookings; this should produce a list of attendees, but I will need to map this.
  def attendees()
    sql = "SELECT members.*
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    WHERE bookings.fitness_class_id = $1"
    values = [@id]
    attendee_data = SqlRunner.run(sql, values)
    attendees = attendee_data.map { |attendee| Member.new(attendee) }
    return attendees
  end

  def attendee_member_ids()
    sql = "SELECT members.*
    FROM members
    INNER JOIN bookings
    ON bookings.member_id = members.id
    WHERE bookings.fitness_class_id = $1"
    values = [@id]
    attendee_data = SqlRunner.run(sql, values)
    attendees = attendee_data.map { |attendee| Member.new(attendee).id }
    return attendees
  end

  def number_of_attendees()
    self.attendees.length
  end

  def overbooked?()
    self.attendees.length >= @capacity ? true : false
  end



  #final end
end
