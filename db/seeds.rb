#requires will go here
require_relative('../models/member')
require_relative('../models/fitness_class')
require_relative('../models/booking')
require('pry')

#new instances of the member class
member1 = Member.new( {'first_name' => 'Tamota', 'last_name' => 'Baku' } )
member2 = Member.new( {'first_name' => 'Micah', 'last_name' => 'Baku' } )
member3 = Member.new( {'first_name' => 'Gabor', 'last_name' => 'Palacsintas' } )
member4 = Member.new( {'first_name' => 'Simone', 'last_name' => 'De Cantara' } )
member5 = Member.new( {'first_name' => 'Jim', 'last_name' => 'Joy' } )

#creating instances of the member class (save method)
member1.save
member2.save
member3.save
member4.save
member5.save

binding.pry
nil

#instances of the fitnessclass
# student4 = Student.new({
#   'first_name' => 'severus',
#   'last_name' => 'snape',
#   'house_id' => house4.id,
#   'age' => 37 })

#creating instances of the fitnessclass (save method)
# student1.save


#new instances of the booking class


#creating instances of the booking class (save method)
