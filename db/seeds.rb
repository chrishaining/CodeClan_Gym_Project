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
member1.save()
member2.save()
member3.save()
member4.save()
member5.save()



#instances of the fitnessclass
fitness_class1 = FitnessClass.new ( { 'name' => 'Pilates' })
fitness_class2 = FitnessClass.new ( { 'name' => 'Yoga' })
fitness_class3 = FitnessClass.new ( { 'name' => 'Killer Kardio' })

fitness_class1.save()
fitness_class2.save()
fitness_class3.save()

#creating instances of the fitnessclass (save method)
# student1.save


binding.pry
nil
#new instances of the booking class


#creating instances of the booking class (save method)
