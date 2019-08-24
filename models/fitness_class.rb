require_relative('../db/sql_runner')

class FitnessClass

attr_accessor :name
attr_reader :id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
end

#define a function to create a new fitness class (the CREATE of CRUD)


#define a function to view all fitness classes (the READ of CRUD)

#define a function to view a specific fitness class/set of fitness classes (the READ of CRUD)


#define a function to update a fitness class (the UPDATE of CRUD)


#define a function to delete all fitness classes (the DELETE of CRUD)

#define a function to delete a specific fitness class (the DELETE of CRUD)


#final end
end
