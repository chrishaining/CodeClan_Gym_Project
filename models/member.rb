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

  #final end
end
