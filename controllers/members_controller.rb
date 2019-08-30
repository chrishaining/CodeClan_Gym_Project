require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/booking.rb')

also_reload('../models/*')

# index
get '/members' do
  @members = Member.view_all()
  erb( :"members/index")
end

#new
get '/members/new' do
  erb(:"members/new")
end

# # create
post '/members' do
  Member.new(params).save
  erb (:"members/create")
end

# show all members 
get '/members' do
  @members = Member.view_all
  erb(:"members")
end

#show a specific member, found by ID
get '/members/:id' do
  @member = Member.view_member_by_id(params[:id])
  @bookings = @member.booked_fitness_classes
  erb( :"/members/show")
end

# edit
get '/members/:id/edit' do
  @member = Member.view_member_by_id(params[:id])
  # erb ( :"/edit")
  erb( :"/members/edit")
end

# update
post '/members/:id' do
  member = Member.new(params)
  member.update
  erb( :"/members/update")
end

# delete
post '/members/:id/delete' do
  Member.delete_member_by_id(params[:id])
  erb( :"members/delete")
end
