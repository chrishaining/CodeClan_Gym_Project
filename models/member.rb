require_relative('../db/sql_runner')


class Member

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  #It would help to have the member name displayed as first_name last_name in the page that displays an individual member's details, possibly also on the class/booking pages.
  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  #define a function to create a new member (the CREATE of CRUD)
  def save()
    sql = "
    INSERT INTO members
    (first_name, last_name)
    VALUES
    ($1, $2)
    RETURNING *
    "
    values = [@first_name, @last_name]
    member = SqlRunner.run(sql, values).first
    @id = member['id'].to_i
  end

  #define a function to view all members (the READ of CRUD).

  def self.view_all()
    sql = "SELECT * FROM members"
    member_data = SqlRunner.run(sql)
    result = member_data.map { |member| Member.new(member) }
    return result
  end


  #was going to create a helper method to use to map items
  # def self.map_items(member_data)
  #   result = member_data.map { |member| Member.new(member) }
  #   return result
  # end

  #define a function to view a specific member/set of members (the READ of CRUD). This is version A
  def self.view_member_by_id(id)
    sql = "
    SELECT * FROM members
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return result
  end

  #define a function to view a specific member/set of members (the READ of CRUD). This is version B
  def view()
    sql = "
    SELECT * FROM members"
    result = SqlRunner.run(sql)[0]
    return result
  end

  #define a function to view all the fitness_classes a member has signed up to. We want to get to the fitness_classes table, which is not directly connected to the members table. So, it requires an inner join on bookings.
  def booked_fitness_classes
    sql = "
    SELECT * from fitness_classes
    INNER JOIN bookings
    ON bookings.fitness_class_id = fitness_classes.id
    WHERE bookings.member_id = $1
    "
    values = [@id]
    fitness_classes_data = SqlRunner.run(sql, values)
    result = fitness_classes_data.map { |fitness_class| FitnessClass.new(fitness_class) }
    return result
  end

  #define a function to update a member (the UPDATE of CRUD)
  def update()
    sql ="
    UPDATE members
    SET first_name = $1, last_name = $2
    WHERE id = $3
    "
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  #define a function to delete all members (the DELETE of CRUD)
  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run(sql)
  end

  #define a function to delete a specific member (the DELETE of CRUD). Version A
  def delete()
    sql ="
    DELETE FROM members
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  #define a function to delete a specific member (the DELETE of CRUD). Version B
  def self.delete_member_by_id(id)
    sql = "
    DELETE FROM members
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end


  #The app should allow the gym to add members to specific classes. This function could plausibly be run on a member or a fitness_class. It would depend on whether a user starts with the fitness_class or starts with the member details. It may be possible to have both routes. For the starts-with-member route, we need to call a function on the member, using the fitness_class as the argument. The ids from the member and the fitness_class can be used to create a new instance of the booking class.

  def make_booking(fitness_class)
    Booking.new('member_id' => @id, 'fitness_class_id' => fitness_class.id).save()
    update()
  end
  #final end
end
