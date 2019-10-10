#requires will go here
require_relative('../models/member')
require_relative('../models/fitness_class')
require_relative('../models/booking')
require('pry')

Booking.delete_all()
Member.delete_all()
FitnessClass.delete_all()

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
fitness_class1 = FitnessClass.new ( { 'name' => 'Pilates', 'datetime' => '2019-08-30 18:00:00', 'capacity' => 5 })
fitness_class2 = FitnessClass.new ( { 'name' => 'Yoga', 'datetime' => '2019-08-29 18:00:00', 'capacity' => 5 })
fitness_class3 = FitnessClass.new ( { 'name' => 'Killer Kardio', 'datetime' => '2019-08-29 14:00:00', 'capacity' => 10 })
fitness_class4 = FitnessClass.new ( { 'name' => 'Codercise', 'datetime' => '2019-08-29 17:00:00', 'capacity' => 1 })
fitness_class5 = FitnessClass.new ( { 'name' => 'Powerpump', 'datetime' => '2019-08-28 08:00:00', 'capacity' => 5 })
fitness_class6 = FitnessClass.new ( { 'name' => 'Jumping Around', 'datetime' => '2019-05-27 17:00:00', 'capacity' => 4 })

#creating instances of the fitnessclass (save method)
fitness_class1.save()
fitness_class2.save()
fitness_class3.save()
fitness_class4.save()
fitness_class5.save()
fitness_class6.save()




#new instances of the booking class
booking1 = Booking.new ( { 'member_id' => member1.id, 'fitness_class_id' => fitness_class1.id})

booking2 = Booking.new ( { 'member_id' => member1.id, 'fitness_class_id' => fitness_class2.id})

booking3 = Booking.new ( { 'member_id' => member2.id, 'fitness_class_id' => fitness_class1.id})

booking4 = Booking.new ( { 'member_id' => member3.id, 'fitness_class_id' => fitness_class1.id})

booking5 = Booking.new ( { 'member_id' => member4.id, 'fitness_class_id' => fitness_class2.id})

booking6 = Booking.new ( { 'member_id' => member5.id, 'fitness_class_id' => fitness_class2.id})

#creating instances of the booking class (save method)
booking1.save()
booking2.save()
booking3.save()
booking4.save()
booking5.save()
booking6.save()
