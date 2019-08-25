require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/fitness_class.rb')
also_reload('../models/*')

# index
get '/index' do
  erb(:"index")
end

# new
# get '/classes/new' do
#   erb(:"new")
# end

# # create - this works, but the system allows the user to enter blank fields, which I want to fix.
# post '/classes' do
#   Member.new(params).save
#   redirect to '/classes'
# end
#
# # show all members
# get '/classes' do
#   @fitness_classes = FitnessClass.view_all
#   erb(:"fitness_classes")
# end

#show a specific member, found by ID - this isn't working. Should I be using a Member.new here?
# get '/members/:id' do
#   @member = Member.view_member_by_id(params[:id]) #or is it ['id']?
#   erb(:show)
# end

# # edit
# get '/members/:id/edit' do
#   @member = Member.view_member_by_id(params['id'])
#   erb(:edit)
# end
#
# # update
# post '/members/:id' do
#   member = Member.new(params)
#   member.update
#   redirect to "/members/#{params['id']}"
# end
#
# # delete
# post '/members/:id/delete' do
#   member = Member.view_member_by_id(params['id'])
#   member.delete
#   redirect to '/members'
# end
