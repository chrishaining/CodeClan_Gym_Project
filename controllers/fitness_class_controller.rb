require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/fitness_class.rb')
also_reload('../models/*')

# index
get '/fitness_classes/index' do
  @fitness_classes = FitnessClass.view_all()
  erb( :"fitness_classes/index")
end

# new
get '/fitness_classes/new' do
  erb( :"fitness_classes/new")
end

# # create - this works, but the system allows the user to enter blank fields, which I want to fix.
post '/fitness_classes' do
  FitnessClass.new(params).save
  redirect to '/fitness_classes/index'
end
#
# # show all classes - not needed, as the index does this
# get '/fitness_classes' do
#   @fitness_classes = FitnessClass.view_all
#   erb(:"fitness_classes")
# end

#show a specific class, found by ID - this isn't working. Should I be using a Member.new here?
get '/fitness_classes/:id' do
  @fitness_class = FitnessClass.view_class_by_id(params['id'])
  erb( :"fitness_classes/show")
end

# # edit
# get '/fitness_classes/:id/edit' do
#   @fitness_class = FitnessClass.view_class_by_id(params['id'])
#   erb(:"fitness_classes/edit")
# end
# #
# # update
# post '/fitness_classes/:id' do
#   class = FitnessClass.new(params)
#   class.update
#   redirect to "/fitness_classes/#{params['id']}"
# end
#
# delete
# post '/fitness_classes/:id/delete' do
#   fitness_class = FitnessClass.view_class_by_id(params['id'])
#   fitness_class.delete
#   redirect to '/fitness_classes'
# end
