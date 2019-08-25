require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')

# index
get '/members/index' do
  @members = Member.view_all()
  erb( :"members/index")
end

#new
get '/members/new' do
  erb(:"members/new")
end

# # create - this works, but the system allows the user to enter blank fields, which I want to fix.
post '/members' do
  Member.new(params).save
  redirect to '/members/index'
end

# show all members - not needed, as members/index does this
# get '/members' do
#   @members = Member.view_all
#   erb(:"members")
# end

#show a specific member, found by ID - this isn't working. Should I be using a Member.new here?
get '/members/:id' do
  @member = Member.view_member_by_id(params['id'])
  erb( :"/members/show")
end

# edit
get '/members/:id/edit' do
  @member = Member.view_member_by_id(params[:id])
  # erb ( :"/edit")
  erb( :"/members/edit")
end
#
# # update
post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to "/members/#{params['id']}"
  # redirect to "/members/#{params['id']}"
end
#
# # delete
post '/members/:id/delete' do
  Member.delete_member_by_id(params['id'])
  redirect to '/members/index'
end
