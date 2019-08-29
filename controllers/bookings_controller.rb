require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/booking.rb')
require_relative('../models/fitness_class.rb')

also_reload('../models/*')

#new
get '/bookings/new' do
  @members = Member.view_all()
  @fitness_classes = FitnessClass.view_upcoming_classes()
  erb( :"bookings/new")
end

# create
post '/bookings' do
  fitness_class = FitnessClass.view_class_by_id(params[:fitness_class_id])
  if Booking.already_booked?(params[:member_id], params[:fitness_class_id])
    erb( :"bookings/already_booked")
  elsif
    fitness_class.overbooked?
    erb ( :"bookings/overbooked")
  else
    @booking = Booking.new(params).save
    erb( :"bookings/create")
  end
end

#show a specific booking
get '/bookings/:id' do
  @booking = Booking.view_booking_by_id(params[:id])
  @member = @booking.view_member()
  @fitness_class = @booking.view_fitness_class()
  erb( :"/bookings/show")
end

#delete
post '/bookings/:id/delete' do
  booking = Booking.view_booking_by_id(params[:id])
  member = booking.view_member()
  Booking.delete_booking_by_id(params[:id])
  erb ( :"bookings/delete")
end
