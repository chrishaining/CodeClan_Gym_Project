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

#final end
end
