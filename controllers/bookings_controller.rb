require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/booking.rb')
require_relative('../models/fitness_class.rb')

also_reload('../models/*')

#new
get '/bookings/new' do
  @members = Member.view_all()
  @fitness_classes = FitnessClass.view_all()
  erb( :"bookings/new")
end

# # create
post '/bookings' do
  # @members = Member.view_all()
  # @fitness_classes = FitnessClass.view_all()
  @booking = Booking.new(params).save
  erb( :"bookings/create")
end

#show a specific booking
get '/bookings/:id' do
  @booking = Booking.view_booking_by_id(params[:id])
  @member= @booking.view_member()
  erb( :"/bookings/show")
end


#delete
post '/bookings/:id/delete' do
  booking = Booking.view_booking_by_id(params[:id])
  member = booking.view_member()
  Booking.delete_booking_by_id(params[:id])
  redirect to '/members/index'
end
